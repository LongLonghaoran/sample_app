Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :josh_id, Setting.APP_ID, Setting.APP_SECRET, {:provider_ignores_state => true}
end