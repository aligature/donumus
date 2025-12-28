ActiveAdmin.register Family do

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

   action_item :new, only: :show do
     link_to 'New Family', new_admin_family_path
   end
  
  permit_params :name

  # Configure filters explicitly to avoid Ransack 4.4.0 errors
  # Remove auto-generated association filters that cause Ransack 4.4.0 errors
  remove_filter :family_users
  remove_filter :users
  
  # Add explicit filters for attributes only (no associations)
  filter :name
  filter :created_at
  filter :updated_at
  filter :last_change_time

end
