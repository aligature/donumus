ActiveAdmin.register User do

   action_item :new, only: :show do
     link_to 'New User', new_admin_user_path
   end

   # See permitted parameters documentation:
   # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
   permit_params :username, :name, :birthday, :administrator

   index do
      selectable_column
      column :id
      column :username
      column :name
      column :birthday
      column :last_sign_in_at
      column :administrator
      actions
   end

   form do |f|
      f.inputs "User" do
         f.input :username
         f.input :name
         f.input :birthday, :as => :date_picker
         f.input :administrator
      end
      f.actions
   end



end
