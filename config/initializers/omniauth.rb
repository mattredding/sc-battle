Rails.application.config.middleware.use OmniAuth::Builder do

  APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")[RAILS_ENV]
  # RAILS_DEFAULT_LOGGER.error("APP_CONFIG")
  # RAILS_DEFAULT_LOGGER.error(APP_CONFIG)

  provider :twitter, APP_CONFIG['TWITTER_KEY'], APP_CONFIG['TWITTER_SECRET']
  provider :soundcloud, APP_CONFIG['SOUNDCLOUD_KEY'], APP_CONFIG['SOUNDCLOUD_SECRET']

end