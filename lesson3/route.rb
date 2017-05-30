#Класс Route (Маршрут):
#Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, 
#а промежуточные могут добавляться между ними.
#Может добавлять промежуточную станцию в список
#Может удалять промежуточную станцию из списка
#Может выводить список всех станций по-порядку от начальной до конечной
#require './station.rb'

class Route
  attr_accessor :station_list, :start_station, :end_station
  #attr_reader   :start_station, :end_station

  def initialize(start_station, end_station)
    @station_list = []
    @station_list  << start_station << end_station
  end

  def add_station(station)
    station_list.insert(-2,station)
  end

  def del_station(station)
    station_list.reject!{|current_station| current_station == station }
  end

end