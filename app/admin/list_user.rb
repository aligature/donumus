ActiveAdmin.register ListUser do

   action_item :new, only: :show do
     link_to 'New List User', new_admin_list_user_path
   end

   index do
      selectable_column
      column :id
      column "List" do |fu|
         fu.list_id ? "%s (%d)" % [List.find(fu.list_id).name, fu.list_id] : "none"
      end
      column "User" do |fu|
         fu.user_id ? "%s (%d)" % [User.find(fu.user_id).name, fu.user_id] : "none"
      end
      actions
   end

   permit_params :list_id, :user_id

end
