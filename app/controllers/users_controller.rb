class UsersController < ApplicationController

   def show
      if(params[:id] == "me")
         @view_user = current_user
      else
         @view_user = User.find(params[:id])
      end
      maybe_redirect(@view_user.check_permissions(current_user))
      @view_user.save_as_view(session)
      @lists = @view_user.lists
      @lists = @lists.sort_by { |list| "%d.%s" % [list.users.count(), list.name] }
   end

end
