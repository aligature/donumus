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

end
