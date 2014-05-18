class UsersController < ApplicationController
   def self.make_stuff
      #User.create(:username => 'andy@aligature.com', :name => 'Andy Webber')
      #User.create(:username => 'nora@aligature.com', :name => 'Nora Webber')
      #pat = User.create(:username => 'pat@allthingsmurphy.com', :name => 'Pat Murphy')

      #List.create(:name => 'Andy Webber')
      #List.create(:name => 'Nora Webber')
      #List.create(:name => 'Andy and Nora')
      #pat_list = List.create(:name => 'Pat Murphy')

      #ListUser.create(:list_id => 1, :user_id => 1)
      #ListUser.create(:list_id => 2, :user_id => 2)
      #ListUser.create(:list_id => 3, :user_id => 1)
      #ListUser.create(:list_id => 3, :user_id => 2)
      #ListUser.create(:list_id => 4, :user_id => 3)

      #family = Family.create(:name => 'Webbers')
      #FamilyUser.create(:family_id => family.id, :user_id => 1)
      #FamilyUser.create(:family_id => family.id, :user_id => 2)

      #family = Family.create(:name => 'Murphys')
      #FamilyUser.create(:family_id => family.id, :user_id => 1)
      #FamilyUser.create(:family_id => family.id, :user_id => 2)
      #FamilyUser.create(:family_id => 2, :user_id => 3)
   end

   def index
      @users = User.all
   end

   def show
      @user = User.find(params[:id])
      @user.save_as_view(session)
      @lists = @user.lists
      @gifts = []
      @lists.each do |list|
         @gifts[list.id] = list.gifts
      end
   end
end
