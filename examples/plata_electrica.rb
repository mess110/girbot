require "bundler/setup"
require "girbot"

class PlataElectrica < Girbot::Step
  def action options = {}
    raise 'invalid options[:details]' unless options[:details].is_a?(Hash)
    raise 'invalid options[:details][:auth]' unless options[:details][:auth].is_a?(Hash)
    raise 'invalid options[:details][:auth][:user]' unless options[:details][:user].is_a?(String)
    raise 'invalid options[:details][:auth][:pass]' unless options[:details][:pass].is_a?(String)
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

    goto 'https://myelectrica.ro/index.php?pagina=login'
    text_in_textfield(options[:details][:user], id: 'myelectrica_utilizator')
    text_in_textfield(options[:details][:pass], id: 'myelectrica_pass')
    sleep 1
    click(:button, id: 'myelectrica_login_btn')

    goto 'https://myelectrica.ro/index.php?pagina=plateste-online'
    sleep 1
    fire id: 'myelectrica_checkall'
    click(:button, type: 'submit')
    sleep 1
    click(:button, id: 'requestMobilPay')

    text_in_textfield(options[:details][:card][:number], id: 'paymentCardNumber')
    text_in_textfield(options[:details][:card][:name], id: 'paymentCardName')
    browser.execute_script("document.getElementById('paymentExpMonth').style.opacity='1';")
    select_value(options[:details][:card][:expMonth], id: 'paymentExpMonth')
    browser.execute_script("document.getElementById('paymentExpYear').style.opacity='1';")
    select_value(options[:details][:card][:expYear], id: 'paymentExpYear')
    text_in_textfield(options[:details][:card][:ccv], id: 'paymentCVV2Number')

    click(:button, type: 'submit')

    loop do
      sleep 1
    end
  end
end

PlataElectrica.run(
  headless: false,
  closeBrowser: false,
  browser: Girbot::BrowserHolder.new(:chrome, nil),
  details: {
    auth: Girbot::Step.read('./examples/details.json')['auth'][0],
    card: Girbot::Step.read('./examples/details.json')['cards'][0]
  }
)
