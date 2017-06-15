#Класс Route (Маршрут):
#Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, 
#а промежуточные могут добавляться между ними.
#Может добавлять промежуточную станцию в список
#Может удалять промежуточную станцию из списка
#Может выводить список всех станций по-порядку от начальной до конечной
#require './station.rb'

class Route


  #Зачем тебе акссессоры :start_station, :end_station. Они ведь не вернут станции, 
  #а всегда вернут nil, т.к. значения для них не устанавливаются. Но лучше вообще сделать методы, 
  #которые бы возвращали первую и последнюю станции из списка
  #station_list должен быть attr_reader, т.к. нельзя этот список напрямую менять

  #attr_accessor :station_list, :start_station, :end_station
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = []
    @stations  << start_station << end_station
  end

  def add_station(station)
    stations.insert(-2,station)
  end

  def del_station(station)
    #Используй лучше метод delete
    #station_list.reject!{|current_station| current_station == station }
    stations.delete(station)
  end

  def start_station
    stations.first
  end

  def end_station
    stations.last
  end

end