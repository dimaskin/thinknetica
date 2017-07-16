class Station

  attr_reader :trains, :station_name
  @@stations_cl = []

  def initialize(station_name)
    @station_name = station_name
    validate!
    @trains = []
    @@stations_cl << self
    #@block = lambda { |t| puts "Train number: #{t.number}, train type: #{t.type}" }
    #@block = lambda do |t| 
    #  t.map { |x| "Train number: #{x.number}, train type: #{x.class}" }
    #end
  end

  #Номер поезда, тип, кол-во вагонов

  def puts_trains(&block)
    @trains.each_with_index  { |train,id | yield(train, id) }
  end

  def self.all
    @@stations_cl
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

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise ArgumentError, "Station name can not be empty!" if @station_name.empty?
    true
  end
end