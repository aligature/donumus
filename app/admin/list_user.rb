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

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end


end
