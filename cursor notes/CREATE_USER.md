# How to Create an Initial User

## Method 1: Rails Console (Recommended)

Open Rails console:
```bash
rails console
```

Then create a user:
```ruby
# Create a regular user
user = User.create!(
  username: "user@example.com",  # This should match the Google email
  name: "John Doe",
  administrator: false,
  birthday: Date.new(1990, 1, 1)  # Optional but recommended
)

# Or create an admin user
admin = User.create!(
  username: "admin@example.com",
  name: "Admin User",
  administrator: true,
  birthday: Date.new(1985, 1, 1)
)
```

## Method 2: Using Seeds File

You can also add users to `db/seeds.rb` and run:
```bash
rails db:seed
```

## Important Notes

1. **Username must match Google email**: Since the app uses Google OAuth, the `username` field should be the email address that the user will use to sign in with Google.

2. **No password needed**: The app uses Google OAuth, so users don't have passwords.

3. **Administrator field**: Set `administrator: true` to give admin access (for ActiveAdmin).

4. **Birthday**: While optional, it's recommended as the app uses it for age calculations and restrictions.

## Example: Create First Admin User

```ruby
rails console

User.create!(
  username: "your-email@gmail.com",  # Your actual Google email
  name: "Your Name",
  administrator: true,
  birthday: Date.new(1990, 1, 1)
)
```

After creating the user, you should be able to sign in with Google using that email address.

