class Train

  attr_accessor :speed, :current_station, :wagons
  attr_reader   :route

  def initialize(number)
    @number = number
    @wagons = []
  end

  protected

  def add_wagon(wagon)
    wagons << wagon
  end

  def del_wagon(wagon)
    wagons.delete(wagon)
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
end