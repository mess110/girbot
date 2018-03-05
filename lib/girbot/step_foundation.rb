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

    def validate_auth(options)
      raise 'invalid options[:details]' unless options[:details].is_a?(Hash)
      raise 'invalid options[:details][:auth]' unless options[:details][:auth].is_a?(Hash)
      raise 'invalid options[:details][:auth][:user]' unless options[:details][:auth][:user].is_a?(String)
      raise 'invalid options[:details][:auth][:pass]' unless options[:details][:auth][:pass].is_a?(String)
    end

    def validate_card(options)
      raise 'invalid options[:details]' unless options[:details].is_a?(Hash)
      raise 'invalid options[:details][:card]' unless options[:details][:card].is_a?(Hash)
      raise 'invalid options[:details][:card][:number]' unless options[:details][:card][:number].is_a?(String)
      raise 'invalid options[:details][:card][:name]' unless options[:details][:card][:name].is_a?(String)
      raise 'invalid options[:details][:card][:expYear]' unless options[:details][:card][:expYear].is_a?(String)
      raise 'invalid options[:details][:card][:expMonth]' unless options[:details][:card][:expMonth].is_a?(String)
      raise 'invalid options[:details][:card][:ccv]' unless options[:details][:card][:ccv].is_a?(String)
      # TODO: deeper validation
      # * number is only digits and correct length
      # * expYear is a year
      # * expMonth is a month
      # * ccv is only digits
    end

    def self.read path
      JSON.parse(File.read(path), symbolize_names: true)
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
