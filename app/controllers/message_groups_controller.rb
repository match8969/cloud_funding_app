class MessageGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message_group, only: [:show, :edit, :update, :destroy]

  # GET /message_groups
  # GET /message_groups.json
  def index
    @message_groups = current_user.message_groups
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
    users = User.where(id: message_group_params[:user_ids])

    if current_user.has_duplicate_group_with?(users)
      redirect_to new_message_group_path, notice: 'Already has the same group!' and return
    end

    @message_group = current_user.message_groups.new(message_group_params)

    respond_to do |format|
      if @message_group.save
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
      params.require(:message_group).permit(user_ids: [])
    end
end
