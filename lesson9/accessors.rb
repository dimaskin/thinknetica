module Accessors

  def self.included(base)
    base.extend ClassMethods 
  end

  module ClassMethods

    def attr_accessor_with_history(*args)
      args.each do |arg|
        var_name = "@#{arg}".to_sym
        define_method(arg) { instance_variable_get(var_name) } 
        define_method("#{arg}=".to_sym) do |value| 
          instance_variable_set(var_name, value)
          @store ||= {}
          @store[var_name] ||= []
          @store[var_name] << value
        end
        define_method("#{arg}_history".to_sym) { @store[var_name] }
      end
    end

    def strong_attr_accessor(name, class_name)
      var_name = "@#{name}".to_sym

      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        raise TypeError, 'wrong class' unless value.class == class_name
          instance_variable_set(var_name, value)
          #p self.class == class_name
          #p self
          #p self.class
          #p class_name
          #p value
          #p value.class
      end
     end

  end
end