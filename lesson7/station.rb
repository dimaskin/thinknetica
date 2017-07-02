class Station

  attr_reader :trains, :station_name
  @@stations = []

  def initialize(station_name)
    @station_name = station_name
    validate!
    @trains = []
    @@stations << self
  end

  def self.all
    @@stations
  end

  def admission_train(train)
    @trains << train
  end

  def list_of_train_in_station(type=nil)
    if !type 
      p @trains
    else
      p "#{type} trains: #{@trains.select {|current_train_in_station| current_train_in_station.type == type}}" 
    end
  end

  def dispatch_train(train)
    @trains.delete(train)
  end

  #опять добавил 2 метода, valid? && validate!
  #однако непонятно, если в initialize проверяем на валидность (например, имя станции не пустое), то, если объект _уже_ существует
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
    raise ArgumentError, "Station name can not be empty!" if @station_name.empty?
    true
  end
end