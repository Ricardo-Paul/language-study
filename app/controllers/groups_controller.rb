class GroupsController < ApplicationController
  include GroupsHelper

  def new
    @group = Group.new
  end

  def show
    find_group
  end

  def create
    @group = Group.create(group_params)
    @group.users << current_user
    if @group.save
      flash[:notice] = "Group Created"
      redirect_to group_path(@group)
    end
  end

  def add_user
    find_and_add_user
  end

  private
  def group_params
    params.require(:group).permit(:name, :description, :memberships)
  end

  def new_group_user_params
    params.require(:group).require(:users).permit(:name)
  end

  def find_group
    @group = Group.find_by(params[:id])
  end

  def find_user
    @user = User.find_by(:name => new_group_user_params[:name])
    #User.find_by(:name => "Rachid")
  end

  def unfound
    "We can't find  #{new_group_user_params[:name]} please try with another name"
  end

end
