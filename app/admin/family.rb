ActiveAdmin.register Family do

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

   action_item :new, only: :show do
     link_to 'New Family', new_admin_family_path
   end
  
  permit_params :name

end
