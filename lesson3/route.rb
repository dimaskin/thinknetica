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
  attr_reader :station_list

  def initialize(start_station, end_station)
    @station_list = []
    @station_list  << start_station << end_station
  end

  def add_station(station)
    station_list.insert(-2,station)
  end

  def del_station(station)
    #Используй лучше метод delete
    #station_list.reject!{|current_station| current_station == station }
    station_list.delete(station)
  end

  def show_start_station
    station_list.first
  end

  def show_end_station
    station_list.last
  end

end