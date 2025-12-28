ActiveAdmin.register List do

   action_item :new, only: :show do
     link_to 'New List', new_admin_list_path
   end

  permit_params :name, :personal

  # Configure filters explicitly to avoid Ransack 4.4.0 errors
  # Remove auto-generated association filters that cause Ransack 4.4.0 errors
  remove_filter :list_users
  remove_filter :users
  remove_filter :families
  remove_filter :gifts
  
  # Add explicit filters for attributes only (no associations)
  filter :name
  filter :personal
  filter :created_at
  filter :updated_at
  filter :last_change_time

end
