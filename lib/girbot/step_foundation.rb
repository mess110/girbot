module Girbot
  class StepFoundation
    attr_accessor :browser_holder

    def initialize browser_holder
      @browser_holder = browser_holder
    end

    def take_whole_action options, openBrowser, closeBrowser
      @browser_holder.init if openBrowser
      validate_browser_presence
      action(options)
      close if closeBrowser
    end

    def validate_browser_presence
      throw 'browser not set' if browser.nil?
    end

    def self.run(options={})
      options[:browser] = BrowserHolder.new if options[:browser].nil?
      options[:headless] = true if options[:headless].nil?
      options[:openBrowser] = true if options[:openBrowser].nil?
      options[:closeBrowser] = true if options[:closeBrowser].nil?

      step = self.new(options[:browser])
      if options[:headless]
        Headless.ly do
          step.take_whole_action(options, options[:openBrowser], options[:closeBrowser])
        end
      else
        step.take_whole_action(options, options[:openBrowser], options[:closeBrowser])
      end
    end
  end
end
