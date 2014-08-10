ActiveAdmin.register PhoneNumber do

  permit_params :user_id, :phone_number, :label

end
