class Train
  include Manufacturer 
  include InstanceCounter
  attr_accessor :speed, :current_station, :wagons
  attr_reader   :route, :number

  @@trains = {}

  def initialize(number)
    @number = number
    @wagons = []
    @speed  = 0
    @@trains[number] = self
    register_instance
  end

  def self.all
    @@trains
  end

  def self.find(number)
    @@trains[number]
  end

  def addSpeed(speed)
    @speed = speed
  end

  def set_route(route)
    @route = route
    @current_station = route.stations[0]
    @current_station.admission_train(self)
  end

  def go_next_station
    @current_station.dispatch_train(self)
    @current_station = @route.stations[@route.stations.index(@current_station)+1]
    @current_station.admission_train(self)    
  end

  def go_prev_station
    @current_station.dispatch_train(self)
    @current_station = @route.stations[@route.stations.index(@current_station)-1]
    @current_station.admission_train(self)    
  end

  def next_station
    @route.stations[@route.stations.index(@current_station)+1]
  end

  def prev_station
    @route.stations[@route.stations.index(@current_station)-1]
  end

  def del_wagon(wagon)
    del_wagon_protected(wagon)
  end  

  def add_wagon(wagon)
    add_wagon_protected(wagon)
  end
  
  protected
  def del_wagon_protected(wagon)
    wagons.delete(wagon) if @speed == 0
  end

  def add_wagon_protected(wagon)
    wagons << wagon if @speed == 0
  end
end