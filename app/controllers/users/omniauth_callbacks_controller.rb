class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
     callback_from :twitter
   end

   def facebook
     callback_from :facebook
   end

   private

   def callback_from(provider)
     provider = provider.to_s

     @user = User.find_for_oauth(request.env['omniauth.auth'])

     if @user.persisted?
         print("persisted true")
       flash[:notice] ="ログインしました。"
       sign_in_and_redirect @user, event: :authentication
     else
         print("persisted false")
       session["devise.#{provider}_data"] = request.env['omniauth.auth']
       redirect_to "/"
       # redirect_to controller: 'sessions', action: 'new'
     end
   end
end
