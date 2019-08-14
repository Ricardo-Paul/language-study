module GroupsHelper

    def find_and_add_user
       find_user
       find_group
        @user.groups << @group
        raise @group.inspect
        flash[:notice] = "User Added"
    end

    
      def find_user
       @user = User.find_by(:name => new_group_user_params[:name])
        #User.find_by(:name => "Rachid")
      end
    
      def unfound
        "We can't find  #{new_group_user_params[:name]} please try with another name"
      end

      def success 
        " Succesful added  #{new_group_user_params[:name]} "
      end

end
