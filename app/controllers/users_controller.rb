class UsersController < ApplicationController

   def index
      @users = User.all
   end

   def show
      @user = User.find(params[:id])
      @user.save_as_view(session)
      @lists = @user.lists
      @lists = @lists.sort_by { |list| "%d.%s" % [list.users.count(), list.name] }
      @gifts = []
      @lists.each do |list|
         @gifts[list.id] = list.gifts
      end
   end

end
