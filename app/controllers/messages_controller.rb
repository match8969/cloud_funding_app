class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.where(message_group_id: current_user.message_groups.pluck(:id)).page(params[:page]).per(10)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @user = User.find(@message.from_user_id)
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    message_group = MessageGroup.find(message_params[:message_group_id])
    message = message_group.messages.new(message_params)
    message.from_user_id = current_user.id

    if message.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, notice: "Failed to save the message.")
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :from_user_id, :message_group_id)
    end
end
