class Station

  attr_reader :trains, :station_name

  def initialize(station_name)
    @station_name = station_name
    @trains = []
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

end