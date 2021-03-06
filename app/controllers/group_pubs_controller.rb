class GroupPubsController < ApplicationController

    def new 
       # @group = Group.find(params[:id])
       # @group_pub = @group.group_pubs.build
    end

    def create
        @group = Group.find(params[:group_id]||params[:id])
        #raise @group.inspect
        @group_pub = GroupPub.create(group_pub_params)
        @group_pub.group_id = @group.id
        @group_pub.user_id = current_user.id
        if @group_pub.save
            redirect_to group_path(@group)
        end
    end

    def edit
        find_group
        find_group_pub
    end

    def update 
         find_group
        find_group_pub
        @group_pub.update(group_pub_params)
        if @group_pub.save 
            redirect_to group_path(@group)
        end
    end

    def destroy
        find_group
        find_group_pub
        @group_pub.destroy
        redirect_to group_path(@group)
    end

    private
    def group_pub_params
        params.require("group_pub").permit(:content)
    end

    def find_group
        @group = Group.find(params[:group_id])
    end

    def find_group_pub
        @group_pub = GroupPub.find(params[:id])
    end


end
