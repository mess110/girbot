require "bundler/setup"
require "girbot"

Girbot::Step.run(
  headless: false,
  actions: [
    { goto: 'https://www.emag.ro/' },
    { text_in_textfield: [ 'hello', id: 'emg-input-autosuggest' ] },
    { click: [ 'a', id: 'emg-category-menu-icon' ] }
  ]
)
