class FamiliesController < ApplicationController
   helper_method :get_members

   def index
      if current_user
         @user = current_user
         @families = @user.families().order(:name)
      end
   end

   def get_members
      @view_family = Family.find(params[:id])
      maybe_redirect(@view_family.check_permissions(current_user))
      @view_family.save_as_view(session)
      @members = @view_family.users.order(:birthday)
   end

   def show
      get_members
   end

   def birthdays
      get_members
   end

end
