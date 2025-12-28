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

   # Configure filters explicitly to avoid Ransack 4.4.0 errors
   # Remove auto-generated association filters that cause Ransack 4.4.0 errors
   remove_filter :list
   remove_filter :user
   
   # Add explicit filters for attributes only
   filter :list_id, as: :select, collection: -> { List.all.map { |l| [l.name, l.id] } }
   filter :user_id, as: :select, collection: -> { User.all.map { |u| [u.name, u.id] } }
   filter :created_at

end
