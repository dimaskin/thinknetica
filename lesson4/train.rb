class Train

  attr_accessor :speed, :current_station, :wagons
  attr_reader   :route, :number

  def initialize(number)
    @number = number
    @wagons = []
    @speed  = 0
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
  
  #у каждого поезда есть действия выше (для удаления вагона не важно знать его тип)
  protected

  def del_wagon_protected(wagon)
    wagons.delete(wagon) if @speed == 0
  end

  def del_wagon_protected(wagon)
    wagons << wagon if @speed == 0
  end
  #наверное, как-то так, для примера?

end