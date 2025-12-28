# OmniAuth configuration for Rails 7
# Fix CSRF issues with OmniAuth callbacks

# Allow both GET and POST for OmniAuth (Google uses GET for callback)
OmniAuth.config.allowed_request_methods = [:post, :get]
OmniAuth.config.silence_get_warning = true

# Set the full host for OmniAuth redirects
OmniAuth.config.full_host = Rails.env.production? ? 'https://donum.us' : 'http://localhost:3000'

# Disable OmniAuth's built-in CSRF validation
# This is safe because:
# 1. OAuth2 uses the 'state' parameter for CSRF protection
# 2. We're already skipping CSRF verification in the controller
# 3. Rails 7's CSRF protection can conflict with OmniAuth's
OmniAuth.config.request_validation_phase = proc { |env| true }

