class FamiliesController < ApplicationController
   def index
      # replace with login
      user_id = 1
      @user = User.find(user_id)
      @user.save_as_login(session)
      @families = @user.families()
   end

   def show
      @family = Family.find(params[:id])
      @family.save_as_view(session)
   end
end
