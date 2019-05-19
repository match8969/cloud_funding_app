class MessageGroupsController < ApplicationController
  before_action :set_message_group, only: [:show, :edit, :update, :destroy]

  # GET /message_groups
  # GET /message_groups.json
  def index
    # TODO: 制限 - 自分が会話できるユーザーの会話のみ取得
    @message_groups = current_user.message_groups
    #@message_groups = MessageGroup.all
  end

  # GET /message_groups/1
  # GET /message_groups/1.json
  def show
    @message = Message.new(message_group_id: @message_group.id)
  end

  # GET /message_groups/new
  def new
    @message_group = MessageGroup.new
  end

  # GET /message_groups/1/edit
  def edit
  end

  # POST /message_groups
  # POST /message_groups.json
  def create
    user = User.find(message_group_params[:user_id])

    # 重複するmessage groupの作成を制限
    if current_user.has_message_group_with?(user)
      redirect_to new_message_group_path, notice: 'Already has the message group with the user!' and return
    end

    @message_group = user.message_groups.new

    respond_to do |format|
      if @message_group.save
        # TODO: Refactring
        current_user_group = UserMessageGroup.new(user_id: current_user.id, message_group_id: @message_group.id) unless current_user.message_groups.include?(@message_group)
        current_user_group.save

        format.html { redirect_to @message_group, notice: 'Message group was successfully created.' }
        format.json { render :show, status: :created, location: @message_group }
      else
        format.html { render :new }
        format.json { render json: @message_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_groups/1
  # PATCH/PUT /message_groups/1.json
  def update
    respond_to do |format|
      if @message_group.update(message_group_params)
        format.html { redirect_to @message_group, notice: 'Message group was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_group }
      else
        format.html { render :edit }
        format.json { render json: @message_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_groups/1
  # DELETE /message_groups/1.json
  def destroy
    @message_group.destroy
    respond_to do |format|
      format.html { redirect_to message_groups_url, notice: 'Message group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_group
      @message_group = MessageGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_group_params
      # params.require(:message_group).permit(:user_id)
      params.require(:message_group).permit(:user_id)
    end
end
