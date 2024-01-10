Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.google_client_id, Rails.application.secrets.google_client_secret,
  redirect_uri: 'http://localhost:3000/users/auth/google_oauth2/callback'
end
# OmniAuth.config.allowed_request_methods = [:post, :get]
