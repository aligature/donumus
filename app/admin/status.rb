ActiveAdmin.register Status do

  permit_params :gift_id, :status, :note, :added_by_user_id

  form do |f|
     f.inputs "status" do
        f.input :gift_id
        f.input :added_by_user_id
        f.input :note
        f.input :status, as: :select, collection: Status.statuses.keys
     end
     f.actions
  end

end
