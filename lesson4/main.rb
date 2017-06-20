require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'wagon'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

=begin
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
p "5.  Добавить станцию в маршрут"
p "6.  Удалить станцию из маршрута"
p "7.  Назначить маршрут поезду"
p "8.  Создать вагон"
p "9.  Добавить вагон к поезду"
p "10. Отцепить вагон от поезда"
p "11. Поехать к следующей станции"
p "12. Вернуться к предыдущей станции"
p "13. Просмотреть список станций"
p "14. Просмотреть список поездов на станции"
p "15. просмотреть список всех поездов"
p "16. просмотреть список всех вагонов"

stations = []
trains   = []
routes   = []
wagons   = []

def next_step
  "next step, please"
end

begin
  answer = gets.chomp.to_i
  case answer
  when 1    #---------------------------------------------
    p "bay"
  when 2    #---------------------------------------------
    p "station name?"
    station_name = gets.chomp.to_s
    if station_name
      stations << Station.new(station_name)
      p stations.last
      p next_step
    else
      p "station name is not valid!"
    end 
  when 3    #---------------------------------------------
    p "train name?"
    train_name = gets.chomp.to_s
    p "train type? (1 - pass, 2 - cargo)"
    train_type = gets.chomp.to_i
    if train_type == 1 
      if train_name
        trains << PassengerTrain.new(train_name)
        p trains.last
      else
        p "train name is not valid!"
      end
    elsif train_type == 2
      if train_name
        trains << CargoTrain.new(train_name)
        p trains.last
      else
        p "train name is not valid!"
      end
    else 
      p "type of train is not valid!"
    end
    p next_step
  when 4    #---------------------------------------------
    tmp_station = stations
    p "Create new route. Choose start station?"
    tmp_station.each.with_index(1) do |st, index| 
      p "#{index} - #{st.station_name}"
    end
    #without check now
    start_number = gets.chomp.to_i
    start_station = tmp_station.delete_at(start_number-1)
    p "Choose final station?"
    tmp_station.each.with_index(1) do |st, index| 
      p "#{index} - #{st.station_name}"
    end
    finish_number = gets.chomp.to_i
    finish_station = tmp_station.delete_at(finish_number-1)
    routes << Route.new(start_station, finish_station)
    p routes.last
    p next_step
  when 5    #---------------------------------------------
    p "Choose route to add a station"
    routes.each.with_index(1) do |route, index| 
      p "#{index} - #{route}"
    end
    route_number  = gets.chomp.to_i
    current_route = routes[route_number-1]
    #without check now
    tmp_station = stations
    tmp_station.delete(current_route.start_station)
    tmp_station.delete(current_route.end_station)
    p "Choose station to add?"
    tmp_station.each.with_index(1) do |st, index| 
      p "#{index} - #{st.station_name}"
    end
    station_to_add = gets.chomp.to_i
    current_route.add_station(tmp_station[station_to_add-1])
    p current_route
    p next_step
  when 6    #---------------------------------------------
    p "Choose route to del a station"
    routes.each.with_index(1) do |route, index| 
      p "#{index} - #{route}"
    end
    route_number  = gets.chomp.to_i
    current_route = routes[route_number-1]
    #without check now
    tmp_station = stations
    p "Choose station to delete?"
    tmp_station.each.with_index(1) do |st, index| 
      p "#{index} - #{st.station_name}"
    end
    station_to_del = gets.chomp.to_i
    current_route.del_station(tmp_station[station_to_del-1])
    p current_route
    p next_step
  when 7    #---------------------------------------------
    p "Choose train"
    trains.each.with_index(1) do |train, index| 
      p "#{index} - #{train.number}"
    end
    train_number = gets.chomp.to_i
    current_train = trains[train_number-1]

    p "Choose route"
    routes.each.with_index(1) do |route, index| 
      p "#{index} - #{route}"
    end
    route_number  = gets.chomp.to_i
    current_route = routes[route_number-1]

    current_train.set_route(current_route)
    p "to train #{current_train.number} set up the route #{current_route}"
    p next_step
  when 8    #---------------------------------------------
    p "What type of wagon would you like to create? (1 - pass, 2 - cargo)"
    wagon_type = gets.chomp.to_i
    if wagon_type == 1 
      wagons << PassengerWagon.new()
      p wagons.last
    elsif wagon_type == 2
      wagons << CargoWagon.new()
      p wagons.last
    else 
      p "type of wagon is not valid!"
    end
    p next_step
  when 9    #---------------------------------------------  
    p "Choose train"
    trains.each.with_index(1) do |train, index| 
      p "#{index} - #{train.number}"
    end
    train_number = gets.chomp.to_i
    current_train = trains[train_number-1]

    p "Choose wagon to add"
    wagons.each.with_index(1) do |wagon, index| 
      p "#{index} - #{wagon}"
    end
    wagon_number = gets.chomp.to_i
    current_wagon = wagons[wagon_number-1]
    current_train.add_wagon(current_wagon)  
    #как не удалять из списка свободных вагонов тот, который не подошел по типу поезда?
    wagons.delete(current_wagon)  

    p current_train
    p next_step
  when 10   #---------------------------------------------  
    p "Choose train"
    trains.each.with_index(1) do |train, index| 
      p "#{index} - #{train.number}"
    end
    train_number = gets.chomp.to_i
    current_train = trains[train_number-1]

    p "Choose wagon to delete"
    current_train.wagons.each.with_index(1) do |wagon, index| 
      p "#{index} - #{wagon}"
    end
    wagon_number = gets.chomp.to_i
    current_wagon = current_train.wagons[wagon_number-1]
    current_train.del_wagon(current_wagon)
    wagons << current_wagon

    p current_train
    p next_step
  when 10   #---------------------------------------------  
    
  when 13
    p stations
  when 14

  when 15
    p trains
  when 16
    p wagons
  end
end while answer != 1
