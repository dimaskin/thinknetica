module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      
    end
  end

  module InstanceMethods
    def register_instance

    end
  end
  
end