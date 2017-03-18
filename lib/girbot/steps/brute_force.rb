module Girbot
  class BruteForce < Step
    def action options
      raise 'missing url option' if options[:url].nil?
      raise 'missing users option' if options[:users].nil?
      raise 'missing passwords option' if options[:passwords].nil?
      raise 'missing username_field option' if options[:username_field].nil?
      raise 'missing password_field option' if options[:password_field].nil?
      raise 'missing login_button option' if options[:login_button].nil?
      raise 'missing break_condition option' if options[:break_condition].nil?

      goto options[:url]

      users = read_file(options[:users])
      passwords = read_file(options[:passwords])

      users.each do |user|
        passwords.each do |password|
          puts "trying: #{user}:#{password}"
          text_in_textfield(user, options[:username_field])
          text_in_textfield(password, options[:password_field])
          click('button', options[:login_button])
          if eval options[:break_condition]
            puts "success: #{user}:#{password}"
            break
          end
        end
      end
    end

    def read_file path
      File.read(path).lines.map(&:strip)
    end
  end
end
