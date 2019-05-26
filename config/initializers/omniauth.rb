
Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, YOUR_APP_ID, YOUR_APP_SECRET
  # provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET_KEY'],
  #   {
  #     redirect_uri: 'http://localhost:3000/admin/omniauth_callbacks',
  #     # scope: 'userinfo.email, userinfo.profile',
  #     # name: :google_admin
  #     access_type: 'offline', 
  #     prompt: 'consent', 
  #     approval_prompt: 'force', 
  #     scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar'
  #   }
  provider :github, ENV['GIT_CLIENT_ID'], ENV['GIT_SECRET_KEY']
end
