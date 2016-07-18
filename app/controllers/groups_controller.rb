class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :leave]

  def leave
    u = @group.user_groups.where(user_id: current_user.id).first
    u.destroy
    redirect_to groups_url
  rescue
    redirect_to groups_url
  end

  def index
    @groups = Group.all
  end

  def show
    @message = Message.new(user_id: current_user.id, group_id: @group.id)
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, user_ids: [])
    end
end
