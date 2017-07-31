module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations
    #метод класса
    class validate(attr_name, type_validate, *options)
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

    end


  end

end