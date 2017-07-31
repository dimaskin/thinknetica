module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations
    def validate(attr_name, type_validate, *options)
      @validations ||= []
      @validations << {attr_name: attr_name, type_validate: type_validate, options: options}
    end
  end

  module InstanceMethods

    def valid?
      validate!
    end

    protected
    def validate!
      self.class.validations.each do |validation|
        value = instance_variable_get("@#{validation[:attr_name]}")
        send validation[:type_validate], validation[:attr_name], value, validation[:options]
        #puts validation[:type_validate], validation[:attr_name], value, validation[:options]
      end
      true
    end

    def presence(name, value, *_args)
      raise "#{self.class} #{name} cant be blank." if value.to_s.empty?
    end

    def format(name, value, regexp)
      raise "wrong format for #{name}." if value !~ regexp.first
    end

    def type(_name, _value, class_name)
      raise "wrong object class #{class_name}." unless is_a?(class_name)
    end

  end

end