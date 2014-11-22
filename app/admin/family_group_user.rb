ActiveAdmin.register FamilyGroupUser do

   index do
      selectable_column
      column :id
      column "FamilyGroup" do |fu|
         usr = "%s (%d)" % [FamilyGroup.find(fu.family_group_id).name, fu.family_group_id]
      end
      column "User" do |fu|
         usr = "%s (%d)" % [User.find(fu.user_id).name, fu.user_id]
      end
      actions
   end

   permit_params :user_id, :family_group_id

end
