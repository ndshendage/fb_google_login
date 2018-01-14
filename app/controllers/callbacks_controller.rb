class CallbacksController < Devise::OmniauthCallbacksController
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = @user.id if @user.present?
        sign_in_and_redirect @user
    end

    def google_oauth2
    	@user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = @user.id if @user.present?
        sign_in_and_redirect @user
    end


end