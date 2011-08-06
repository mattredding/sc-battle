# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

ScBattle::Application.config.secret_token = '33cf959e2566824ff0e63ad0541e36aecc75580e1faaac368dbff92378ba121370c2006f541b3dd477390ff9ab8b7b7c1ce9762a6293ced85e29a9f398241f42'
APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")[RAILS_ENV]