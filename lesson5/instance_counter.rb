module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @instances
    end

    protected

    def add_instances() 
      @instances ||= 0
      @instances += 1
      #p "add instance! 2"
    end

  end

  module InstanceMethods
    protected
    def register_instance
      self.class.send(:add_instances)
      p "add instance! 1"
    end
  end
  
end