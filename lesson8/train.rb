require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include InstanceCounter

  attr_accessor :speed, :current_station, :wagons
  attr_reader   :route, :number

  @@trains = {}

  TRAIN_NUMBER_TEMPLATE = /^[a-z0-9]{3}-?[a-z0-9]{2}$/

  def initialize(number)
    @number = number
    validate!
    @wagons = []
    @speed  = 0
    @@trains[number] = self
    register_instance
    @block = ->(t) { puts t }
  end

  def each_wagon
    @wagons.each_with_index { |wagon, id| yield(wagon, id) }
  end

  def self.all
    @@trains
  end

  def self.find(number)
    @@trains[number]
  end

  def add_speed(speed)
    @speed = speed
  end

  def establish_route(route)
    @route = route
    @current_station = route.stations[0]
    @current_station.admission_train(self)
  end

  def go_next_station
    @current_station.dispatch_train(self)
    @current_station = @route.stations[@route.stations.index(@current_station) + 1]
    @current_station.admission_train(self)
  end

  def go_prev_station
    @current_station.dispatch_train(self)
    @current_station = @route.stations[@route.stations.index(@current_station) - 1]
    @current_station.admission_train(self)
  end

  def next_station
    @route.stations[@route.stations.index(@current_station) + 1]
  end

  def prev_station
    @route.stations[@route.stations.index(@current_station) - 1]
  end

  def del_wagon(wagon)
    del_wagon_protected(wagon)
  end

  def add_wagon(wagon)
    add_wagon_protected(wagon)
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def del_wagon_protected(wagon)
    wagons.delete(wagon) if @speed.zero?
  end

  def add_wagon_protected(wagon)
    wagons << wagon if @speed.zero?
  end

  def validate!
    raise ArgumentError, 'Number can not be empty!' if @number.empty?
    raise ArgumentError, 'Wrong number format!' if @number !~ TRAIN_NUMBER_TEMPLATE
    true
  end
end
