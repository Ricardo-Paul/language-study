module GroupsHelper
    def find_and_add_user
        if find_group && !find_user
            redirect_to group_path(@group)
            flash[:alert] = unfound
          end
          
          if find_user && find_group
            if !@group.users.include?(@user)
                @group.users << @user
                @group.save
            else
              redirect_to group_path(@group)
              flash[:alert] = "User already existed"
            end
          end
    end
end
