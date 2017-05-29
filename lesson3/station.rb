#Класс Station (Станция):
#Имеет название, которое указывается при ее создании
#Может принимать поезда (по одному за раз)
#Может возвращать список всех поездов на станции, находящиеся в текущий момент
#Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
#Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
class Station

  def initialize(station_name)
    @station_name = station_name
    @train_in_station = []
  end

  def admission_train(train)
    @train_in_station << train
  end

  def list_of_train_in_station(type=nil)
    if !type 
      p @train_in_station
    else
      p "e!"
    end
  end

end