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

  #опять добавил 2 метода, valid? && validate!
  #однако непонятно, если в initialize проверяем на валидность (например, станции не пустые), то, если объект _уже_ существует
  #то значит у него все параметры валидны. Если метод valid? применяется к существующему объекту и выкидывает исключение, то как такой
  #объект был создан?
  def valid?
    validate!
  rescue
    false
  end
  #########################################################################?

  protected

  def validate!
    raise ArgumentError, "start_station can not be empty!" if @start_station.is_a? Station
    raise ArgumentError, "end_station can not be empty!"   if @end_station.is_a? Station
    true
  end

end