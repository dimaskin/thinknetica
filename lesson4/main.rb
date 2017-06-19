#Разбить программу на отдельные классы (каждый класс в отдельном файле)
#Разделить поезда на два типа PassengerTrain и CargoTrain, 
#сделать родителя для классов, который будет содержать общие методы и свойства
#Определить, какие методы могут быть помещены в private/protected и вынести их в такую секцию. 
#В комментарии к методу обосновать, почему он был вынесен в private/protected
#Вагоны теперь делятся на грузовые и пассажирские (отдельные классы). 
#К пассажирскому поезду можно прицепить только пассажирские, к грузовому - грузовые. 
#При добавлении вагона к поезду, объект вагона должен передаваться как аругмент метода и сохраняться во внутреннем массиве поезда, 
#в отличие от предыдущего задания, где мы считали только кол-во вагонов. 
#Параметр конструктора "кол-во вагонов" при этом можно удалить.
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'wagon'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

=begin
#Создавать станции
st1 = Station.new("st1")
st2 = Station.new("st2")
st3 = Station.new("st3")
st4 = Station.new("st4")

#Создавать поезда
pass_train1  = PassengerTrain.new("001")
cargo_train1 = CargoTrain.new("002")
p pass_train1
p cargo_train1
p "----------1"

#Создавать маршруты и управлять станциями в нем (добавлять, удалять)
route1 = Route.new(st1,st4)
route1.add_station(st3)
route1.add_station(st2)
route1.del_station(st3)
p route1
p "----------2"

#Назначать маршрут поезду
pass_train1.set_route(route1)
p pass_train1.route
p "----------3"

#Добавлять вагоны к поезду
cargo_wagon1 = CargoWagon.new()
pass_wagon1  = PassengerWagon.new()
pass_wagon2  = PassengerWagon.new()
pass_wagon3  = PassengerWagon.new()

pass_train1.add_wagon(pass_wagon1)
pass_train1.add_wagon(pass_wagon2)
pass_train1.add_wagon(pass_wagon3)
pass_train1.add_wagon(cargo_wagon1)
p pass_train1
p "----------4"

#Отцеплять вагоны от поезда
pass_train1.del_wagon(pass_wagon3)
p pass_train1
p "----------5"

#Перемещать поезд по маршруту вперед и назад
p pass_train1.current_station
pass_train1.go_next_station
p pass_train1.current_station
pass_train1.go_next_station
p pass_train1.current_station
pass_train1.go_prev_station
p pass_train1.current_station
p "----------6"

#Просматривать список станций и список поездов на станции
p route1.stations
st1.list_of_train_in_station
st2.list_of_train_in_station
st3.list_of_train_in_station
st4.list_of_train_in_station
p "----------7"
=end
p "1.  Завершить работу"
p "2.  Создать станцию"
p "3.  Создать поезд"
p "4.  Создать маршрут"
p "5.  Добавить станцию в текущий маршрут"
p "6.  Удалить станцию из текущего маршрута"
p "7.  Назначить маршрут поезду"
p "8.  Добавить вагон к поезду"
p "9.  Отцепить вагон от поезда"
p "10. Поехать к следующей станции"
p "11. Вернуться к предыдущей станции"
p "12. Просмотреть список станций"
p "13. Просмотреть список поездов на станции"
p "14. просмотреть список всех поездов"

stations = []
trains   = []

def next_step
  "next step, please"
end

begin
  answer = gets.chomp.to_i
  case answer
  when 1
    p "bay"
  when 2 
    p "station name?"
    st = gets.chomp.to_s
    if st
      stations << Station.new(st)
      p stations.last
      p next_step
    else
      p "station name is not valid!"
    end 
  when 3
    p "train name?"
    train_name = gets.chomp.to_s
    p "train type? (1 - pass, 2 - cargo)"
    train_type = gets.chomp.to_i
    if train_type == 1 
      PassengerTrain.new(train_name)
    elsif train_type == 2
      CargoTrain.new(train_name)
    else 
      p "type of train is not valid!"
    end
    p next_step
  when 12
    p stations
  end
end while answer != 1
