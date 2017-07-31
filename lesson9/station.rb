class Station
  include Validation
  
  attr_reader :trains, :station_name

  validate :station_name, :presence

  @@stations_cl ||= []

  def initialize(station_name)
    @station_name = station_name
    validate!
    @trains = []
    @@stations_cl << self
    validate!
  end

  def each_train
    @trains.each_with_index { |train, id| yield(train, id) }
  end

  def self.all
    @@stations_cl
  end

  def admission_train(train)
    @trains << train
  end

  def list_of_train_in_station(type = nil)
    if !type
      p @trains
    else
      p "#{type} trains: #{@trains.select { |current_train_in_station| current_train_in_station.type == type }}"
    end
  end

  def dispatch_train(train)
    @trains.delete(train)
  end

  def valid?
    validate!
  rescue
    false
  end

end
