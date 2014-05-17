OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '862525493860-9gsmbedn084cl7vvm0its2hal37pjks7.apps.googleusercontent.com', 'Q85XLe0-9pVoQIa3dipCypI0', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end