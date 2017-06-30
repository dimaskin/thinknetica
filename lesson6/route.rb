class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    validate!
    @stations = []
    @stations  << start_station << end_station
  end

  def add_station(station)
    stations.insert(-2,station)
  end

  def del_station(station)
    stations.delete(station)
  end

  def start_station
    stations.first
  end

  def end_station
    stations.last
  end

  protected

  def validate!
    begin
      raise ArgumentError, "start_station can not be empty!" if @start_station.is_a? Station
      raise ArgumentError, "end_station can not be empty!"   if @end_station.is_a? Station
      true
    rescue 
      p "start_station and end_station can not be empty!"
    end
  end

end