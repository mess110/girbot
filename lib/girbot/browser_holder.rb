module Girbot
  class BrowserHolder
    attr_accessor :which, :proxy, :browser

    def initialize which='firefox', proxy=nil
      @which = which
      @proxy = proxy
    end

    def init
      if @proxy.nil?
        @browser = send(@which)
      else
        @browser = send("#{@which}_proxy", @proxy)
      end
    end

    def firefox
      Watir::Browser.new :firefox
    end

    def firefox_proxy proxy
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile.proxy = Selenium::WebDriver::Proxy.new :http => proxy, :ssl => proxy
      Watir::Browser.new :firefox, :profile => profile
    end

    def chrome
      Watir::Browser.new :chrome
    end

    def chrome proxy
      switches = "--proxy-server=#{proxy}"
      Watir::Browser.new :chrome, :switches => switches
    end
  end
end
