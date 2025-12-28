ActiveAdmin.register PhoneNumber do

  permit_params :user_id, :phone_number, :label

  # Configure filters explicitly to avoid Ransack 4.4.0 errors
  # Remove auto-generated association filters that cause Ransack 4.4.0 errors
  remove_filter :user
  
  # Add explicit filters for attributes only
  filter :user_id, as: :select, collection: -> { User.all.map { |u| [u.name, u.id] } }
  filter :phone_number
  filter :label
  filter :created_at
  filter :updated_at

end
