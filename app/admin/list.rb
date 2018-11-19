ActiveAdmin.register List do

   action_item :new, only: :show do
     link_to 'New List', new_admin_list_path
   end

  permit_params :name, :personal

end
