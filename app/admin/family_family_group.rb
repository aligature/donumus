ActiveAdmin.register FamilyFamilyGroup do

   index do
      selectable_column
      column :id
      column "Family" do |fu|
         usr = "%s (%d)" % [Family.find(fu.family_id).name, fu.family_id]
      end
      column "FamilyGroup" do |fu|
         usr = "%s (%d)" % [FamilyGroup.find(fu.family_group_id).name, fu.family_group_id]
      end
      actions
   end

   permit_params :family_id, :family_group_id

end
