class Station
  include CommonValidate
  attr_reader :trains, :station_name
  @@stations = []

  def initialize(station_name)
    valid?(station_name) #only name
    @station_name = station_name
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

  def valid?(val)
    val_is_empty?(val)
  end
end