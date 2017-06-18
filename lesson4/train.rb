class Train

  attr_accessor :speed, :current_station, :wagons
  attr_reader   :route

  def initialize(number)
    @number = number
    @wagons = []
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
    wagons.delete(wagon)
  end  

  #у каждого поезда есть действия выше (для удаления вагона не важно знать его тип)
  protected

  #здесь необходимо знать тип вагона, выносим метод в дочерний класс, там и присваиваем тип вагону
  def add_wagon(wagon)
    wagons << wagon
  end


end