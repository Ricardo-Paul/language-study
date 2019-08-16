class GroupsController < ApplicationController
  include GroupsHelper

  def new
    @group = Group.new
  end

  def show
   find_group
  # @group_pub = GroupPub.new
   @group_pub = current_user.group_pubs.build
  end

  def create
    @group = Group.create(group_params)
    @group.users << current_user
    current_user.groups << @group
    if @group.save
      flash[:notice] = "Group Created"
      redirect_to group_path(@group)
    end
  end

  def add_user
   # redirect_to :error unless @user
    find_group
    find_and_add_user
    redirect_to group_path(@group)
  end




  def error 
    render plain: "Error"
  end

  private
  def group_params
    params.require(:group).permit(:id, :name, :description, :memberships)
  end

  def new_group_user_params
    params.require(:group).require(:users).permit(:name)
  end

  def find_group
   # @group = Group.find(params[:id])
   id = params[:group_id] || params[:id]
  @group = Group.find(id)
  end

end
