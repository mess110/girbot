require "bundler/setup"
require "girbot"

browser_holder = Girbot::BrowserHolder.new(:chrome, nil)

class TestRun < Girbot::Step
  def action options = {}
    goto "file://#{Dir.pwd}/examples/test_basic.html"

    text_in_textfield('john doe', id: 'name')

    data = wait_for_data
    puts data
  end
end

class Iframe < Girbot::Step
  def action options = {}
    basic_path =  "file://#{Dir.pwd}/examples/test_basic.html"
    goto "file://#{Dir.pwd}/examples/test_iframe.html"

    exec_js("document.querySelectorAll('iframe')[0].src = '#{basic_path}';")

    browser.iframes[0].text_field(id: 'name').set 'john doe'

    loop do
      sleep 1
    end
  end
end


TestRun.run(
  headless: false,
  openBrowser: true,
  closeBrowser: false,
  browser: browser_holder,
)

Iframe.run(
  headless: false,
  openBrowser: false,
  closeBrowser: false,
  browser: browser_holder,
)
