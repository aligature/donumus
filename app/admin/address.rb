ActiveAdmin.register Address do

  permit_params :user_id, :address, :label

end
