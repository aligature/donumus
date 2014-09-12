class UserInfoController < ApplicationController

   def show
      @user = User.find(params[:id])
      maybe_redirect(@user.check_permissions(current_user))
      @note = @user.user_note
      @emails = @user.emails.order(:email)
      @phone_numbers = @user.phone_numbers
      @addresses = @user.addresses
   end

end
