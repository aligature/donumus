class UsersController < ApplicationController
  def index
      #User.create(:username => 'andy@aligature.com', :name => 'Andy Webber')
      #User.create(:username => 'nora@aligature.com', :name => 'Nora Webber')
    
      #List.create(:name => 'Andy Webber')
      #List.create(:name => 'Nora Webber')
      #List.create(:name => 'Andy and Nora')
     
      #ListUsers.create(:list_id => 1, :user_id => 1)
      #ListUsers.create(:list_id => 2, :user_id => 2)
      #ListUsers.create(:list_id => 3, :user_id => 1)
      #ListUsers.create(:list_id => 3, :user_id => 2)

      @users = User.all
  end

   def show
      puts :id
      @user = User.find(params[:id])
      @lists = @user.lists
      @gifts = []
      @lists.each do |list|
         @gifts[list.id] = list.gifts
      end
   end
end
