ActiveAdmin.register FamilyUser do

   index do
      selectable_column
      column :id
      column "Family" do |fu|
         usr = "%s (%d)" % [Family.find(fu.family_id).name, fu.family_id]
      end
      column "User" do |fu|
         usr = "%s (%d)" % [User.find(fu.user_id).name, fu.user_id]
      end
      column :hidden
      actions
   end

   permit_params :user_id, :family_id, :hidden

end
