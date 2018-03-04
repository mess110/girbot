module Girbot
  module WatirShortcuts
    def browser
      @browser_holder.browser
    end

    def goto url
      browser.goto url
    end

    def text_in_textfield text, query
      browser.text_field(query).set text
    end

    def fire query
      browser.checkbox(query).fire_event :click
    end

    def select_value(value, query)
      browser.select_list(query).select_value(value)
    end

    # Examples:
    #
    #   click(:button, id: 'my-id')
    #   click(:button, type: 'submit')
    #
    def click(type, query)
      browser.send(type, query).click
    end

    def close
      browser.close
    end
  end
end
