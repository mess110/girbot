module Girbot
  class Step < StepFoundation
    include WatirShortcuts

    def action options
      raise 'actions missing' if options[:actions].nil?
      raise 'actions needs to be an array' if options[:actions].class != Array

      options[:actions].each do |action|
        key = action.keys.first
        raise 'missing action key' if key.nil?
        raise 'invalid action key' if !Girbot::WatirShortcuts.instance_methods.include? key.to_sym
        action[key] = [action[key]] if action[key].class != Array
      end

      options[:actions].each do |action|
        key = action.keys.first
        send(key, *action[key])
      end
    end
  end
end
