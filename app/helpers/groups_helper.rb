module GroupsHelper

    def find_and_add_user
       find_user
       find_group

      if find_group && find_user
          if !@user.groups.include?(@group)
            @user.groups << @group
            flash[:notice] = success
          else
            flash[:alert] = included
          end
      else
          flash[:alert] = unfound
      end

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

      def included
        " #{new_group_user_params[:name]} has already been added to this group "
      end

end
