class FamiliesController < ApplicationController

   def index
      if current_user
         @user = current_user
         @families = @user.families().order(:name)
      end
   end

   def show
      @family = Family.find(params[:id])
      maybe_redirect(@family.check_permissions(current_user))
      @family.save_as_view(session)
      @members = @family.users.order(:birthday)
   end

end
