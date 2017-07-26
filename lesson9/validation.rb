module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    #метод класса, 
    class validate(attr_name, type_validate, *additional_args)

    end
  end

  module InstanceMethods

    def valid?
      validate!
    end

    def validate!

    end


  end

end