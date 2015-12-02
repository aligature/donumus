class UsersController < ApplicationController

   def show
      if(params[:id] == "me")
         @user = current_user
      else
         @user = User.find(params[:id])
      end
      maybe_redirect(@user.check_permissions(current_user))
      @user.save_as_view(session)
      @lists = @user.lists
      @lists = @lists.sort_by { |list| "%d.%s" % [list.users.count(), list.name] }
   end

end
