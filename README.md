# Girbot

> bleep-blop wreak havoc bleep mischief - Girbot

Girbot wants to help you automate boring tasks. You define steps which can be run
in different browsers.

```
Girbot::Step.run(
  # different steps can share a BrowserHolder
  browser: BrowserHolder.new,

  # if the browser is hidden
  headless: true,

  # opens the browser in the BrowserHolder
  openBrowser: true,

  # closes the browser in the BrowserHolder
  closeBrowser: true,

  # each action in the step is executed in sequence one after the other
  actions: [

    # go to a specific webpage
    { goto: 'https://www.google.com' }

    # set text in a textfield
    { text_in_textfield: [ 'text', id: 'id' ]}

    # click an item
    { click: [ 'button', id: 'submit' ] }
  ]
)
```

See examples folder for more information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'girbot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install girbot

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mess110/girbot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
