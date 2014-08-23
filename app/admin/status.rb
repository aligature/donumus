ActiveAdmin.register Status do

  permit_params :gift_id, :status, :note, :added_by_user_id

   index do
      selectable_column
      column :gift_id
      column "Added By" do |s|
         user = s.added_by_user
         user ? "%s (%d)" % [user.name, user.id] : "none"
         #usr = "%s (%d)" % [User.find(fu.family_id).name, fu.family_id]
      end
      column :note
      column :status
      actions
   end

  form do |f|
     f.inputs "status" do |s|
        f.input :gift_id
        f.input :added_by_user_id, :as => :select, collection: User.all
        f.input :note
        f.input :status, as: :select, collection: Status.statuses.keys
     end
     f.actions
  end

end
