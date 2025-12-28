# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Example: Create an initial admin user
# Uncomment and modify the email/name to create your first user
#
 User.create!(
   username: "andy@aligature.com",  # Must match the Google email they'll use to sign in
   name: "Andy Webber",
   administrator: true,
   birthday: Date.new(1981, 12, 31)
 )
