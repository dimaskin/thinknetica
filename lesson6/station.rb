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

  protected

  def validate!
    begin   
      raise ArgumentError, "Station name can not be empty!" if @station_name.empty?
      true
    rescue
      p "Station name can not be empty!!"
      false
    end
  end
end