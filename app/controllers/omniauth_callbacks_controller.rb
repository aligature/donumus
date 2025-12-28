class OmniauthCallbacksController < Devise::OmniauthCallbacksController
   # Skip CSRF verification for OmniAuth callbacks
   skip_before_action :verify_authenticity_token, only: [:google_oauth2, :failure, :passthru]

   # This method is called when user clicks "Sign in with Google"
   # The request should be intercepted by OmniAuth middleware before reaching here
   # If we reach here, the middleware didn't work, so we handle it manually
   def passthru
      # Check if environment variables are set
      if ENV["GOOGLE_CLIENT_ID"].blank? || ENV["GOOGLE_CLIENT_SECRET"].blank?
         redirect_to root_path, alert: "Google OAuth is not configured. Please set GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET environment variables."
         return
      end
      
      # Build the Google OAuth authorization URL manually
      # This is a fallback if OmniAuth middleware doesn't work
      params = {
        client_id: ENV["GOOGLE_CLIENT_ID"],
        redirect_uri: user_google_oauth2_omniauth_callback_url,
        response_type: 'code',
        scope: 'openid email profile',
        access_type: 'offline',
        prompt: 'select_account'
      }
      
      auth_url = "https://accounts.google.com/o/oauth2/auth?#{params.to_query}"
      redirect_to auth_url, allow_other_host: true
   end

   def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

      if @user and @user.persisted?
         flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
         sign_in_and_redirect @user, :event => :authentication
      else
         session["devise.google_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
         redirect_to families_missing_path, alert: "User not found. Please contact an administrator."
      end
   end

   def failure
      redirect_to root_path, alert: "Authentication failed. Please try again."
   end
end
