require "bundler/setup"
require "girbot"

class TestRun < Girbot::Step
  def action options = {}
    goto 'file:///home/kiki/pr0n/girbot/select.html'

    loop do
      sleep 1
    end
  end
end

TestRun.run(
  headless: false,
  closeBrowser: false,
  browser: Girbot::BrowserHolder.new(:chrome, nil),
)
