module Girbot
  module WatirShortcuts
    def browser
      @browser_holder.browser
    end

    def goto url
      browser.goto url
    end

    def text_in_textfield text, query
      puts query
      browser.text_field(query).set text
    end

    def click(type, query)
      browser.send(type, query).click
    end

    def close
      browser.close
    end
  end
end
