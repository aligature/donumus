ActiveAdmin.register User do

   action_item :new, only: :show do
     link_to 'New User', new_admin_user_path
   end

   # See permitted parameters documentation:
   # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
   permit_params :username, :name, :birthday, :administrator

   # Configure filters explicitly to avoid Ransack 4.4.0 errors
   # Remove auto-generated association filters that cause Ransack 4.4.0 errors
   remove_filter :list_users
   remove_filter :lists
   remove_filter :family_users
   remove_filter :families
   remove_filter :user_note
   remove_filter :addresses
   remove_filter :emails
   remove_filter :phone_numbers
   remove_filter :pollyannas
   
   # Add explicit filters for attributes only (no associations to avoid Ransack 4.4.0 errors)
   filter :username
   filter :name
   filter :birthday
   filter :administrator
   filter :created_at
   filter :updated_at
   filter :last_sign_in_at
   filter :sign_in_count

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
