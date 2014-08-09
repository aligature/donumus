ActiveAdmin.register ListUser do

   index do
      selectable_column
      column :id
      column "List" do |fu|
         usr = "%s (%d)" % [List.find(fu.list_id).name, fu.list_id]
      end
      column "User" do |fu|
         usr = "%s (%d)" % [User.find(fu.user_id).name, fu.user_id]
      end
      actions
   end

   permit_params :list_id, :user_id

end
