class FamiliesController < ApplicationController
   def index
      # replace with login
      if current_user
         @user = current_user
         @families = @user.families()
      end
   end

   def show
      @family = Family.find(params[:id])
      @family.save_as_view(session)
   end

   def missing
      puts "IN MISSING"
   end
end
