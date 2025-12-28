ActiveAdmin.register Pollyanna do

   action_item :new, only: :show do
     link_to 'New Pollyanna', new_admin_pollyanna_path
   end

   index do
      selectable_column
      column :id
      column "Giver" do |fu|
         usr = "%s (%d)" % [User.find(fu.giver_id).name, fu.giver_id]
      end
      column "Receiver" do |fu|
         usr = "%s (%d)" % [User.find(fu.receiver_id).name, fu.receiver_id]
      end
      column :name
      actions
   end

   permit_params :giver_id, :receiver_id, :name

   # Configure filters explicitly to avoid Ransack 4.4.0 errors
   # Remove auto-generated association filters that cause Ransack 4.4.0 errors
   remove_filter :giver
   remove_filter :receiver
   
   # Add explicit filters for attributes only (no associations)
   filter :giver_id
   filter :receiver_id
   filter :name
   filter :created_at
   filter :updated_at

end
