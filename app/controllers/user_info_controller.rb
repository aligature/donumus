class UserInfoController < ApplicationController

   def show
      @user = User.find(params[:id])
      @note = @user.user_note
      @emails = @user.emails.order(:email)
      @phone_numbers = @user.phone_numbers
      @addresses = @user.addresses
   end

end
