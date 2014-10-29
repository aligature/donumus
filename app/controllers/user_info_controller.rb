class UserInfoController < ApplicationController

   def show
      id = params[:id]
      @user = User.find(id)
      maybe_redirect(@user.check_permissions(current_user))
      @note = @user.user_note
      if not @note
         @note = UserNote.new(:user_id => id)
         @note.save
      end
      @emails = @user.emails.order(:email)
      @phone_numbers = @user.phone_numbers
      @addresses = @user.addresses
   end

end
