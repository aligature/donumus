ActiveAdmin.register Email do

  permit_params :user_id, :email, :label

end
