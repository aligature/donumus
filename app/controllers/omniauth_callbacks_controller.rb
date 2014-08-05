class OmniauthCallbacksController < Devise::OmniauthCallbacksController
   def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

      if @user and @user.persisted?
         flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
         sign_in_and_redirect @user, :event => :authentication
      else
         redirect_to Family, action: "missing"
      end
   end
end
