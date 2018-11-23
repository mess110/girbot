module Girbot
  module WatirShortcuts
    def browser
      @browser_holder.browser
    end

    def maximize
      browser.driver.manage.window.maximize
    rescue Selenium::WebDriver::Error::UnknownError => e
      puts 'Could not maximize. Moving on.'
      puts e
      puts e.backtrace
    end

    def goto url
      browser.goto url
    end

    def text_in_textfield text, query
      browser.text_field(query).set text
    end

    def append_to_textfield text, query
      input = browser.text_field(query)
      text.chars.each do |c|
        input.append(c)
      end
    end

    def exec_js js
      browser.execute_script(js)
    end

    def select_value(value, query)
      browser.select_list(query).select(value)
    end

    # Examples:
    #
    #   click(:button, id: 'my-id')
    #   click(:button, type: 'submit')
    #
    def click(type, query)
      browser.send(type, query).click
    end

    # Examples:
    #
    #   fire_event(:checkbox, id: 'my-id')
    #   fire_event(:checkbox, class: 'my-class', :click)
    #
    def fire_event(type, query, event = :click)
      browser.send(type, query).fire_event event
    end

    def screenshot(label, preview = false)
      timestamp = Time.now.strftime("%F %T")
      result = browser.screenshot.save "screenshots/#{label}-#{timestamp}.png"
      if preview
        pid = spawn("xdg-open #{result.path}")
        Process.detach(pid)
      end
      result
    end

    def close
      browser.close
    end
  end
end
