require "bundler/setup"
require "girbot"

class CookieClicker < Girbot::Step
  def action options
    goto 'http://orteil.dashnet.org/cookieclicker/'

    sleep 5

    cookie = browser.div(id: 'bigCookie')

    i = 0
    loop do
      i += 1
      cookie.click
      if i == 100
        grow('product unlocked enabled')
        grow('crate upgrade enabled')
        i = 0
      end
    end
  end

  def grow class_name
    item = browser.divs(class: class_name).to_a.last
    unless item.nil?
      item.click
    end
  end
end

CookieClicker.run(
  headless: false,
  closeBrowser: false,
  browser: Girbot::BrowserHolder.new(:firefox)
)
