class Controller
  attr_accessor :stations, :trains, :routes, :wagons

  def initialize
    @stations = []
    @trains   = []
    @routes   = []
    @wagons   = []
  end

  def create_station
    p "station name?"
    station_name = gets.chomp.to_s
    stations << Station.new(station_name)
    p next_step
  end

  def create_train
    p "train name?"
    train_name = gets.chomp.to_s
    p "train type? (1 - pass, 2 - cargo)"
    train_type = gets.chomp.to_i
    trains << PassengerTrain.new(train_name) if train_name && train_type == 1
    trains << CargoTrain.new(train_name) if train_name && train_type == 2
    p next_step
  end

  def create_route
    tmp_station = stations
    p "Create new route. Choose start station?"
    tmp_station.each.with_index(1) do |st, index| 
      p "#{index} - #{st.station_name}"
    end
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
  end

  def add_station_to_route
    p "Choose route to add a station"
    routes.each.with_index(1) do |route, index| 
      p "#{index} - #{route}"
    end
    route_number  = gets.chomp.to_i
    current_route = routes[route_number-1]
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
  end    

  def del_station_from_route
    p "Choose route to del a station"
    routes.each.with_index(1) do |route, index| 
      p "#{index} - #{route}"
    end
    route_number  = gets.chomp.to_i
    current_route = routes[route_number-1]
    tmp_station = stations
    p "Choose station to delete?"
    tmp_station.each.with_index(1) do |st, index| 
      p "#{index} - #{st.station_name}"
    end
    station_to_del = gets.chomp.to_i
    current_route.del_station(tmp_station[station_to_del-1])
    p current_route
    p next_step
  end

  def set_route_to_train
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
  end

  def create_wagon
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
  end

  def add_wagon_to_train
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
    wagons.delete(current_wagon)  

    p current_train
    p next_step
  end

  def del_wagon_from_train
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
  end

  def go_next_station
    p "Choose train"
    trains.each.with_index(1) do |train, index| 
      p "#{index} - #{train.number}"
    end
    train_number = gets.chomp.to_i
    current_train = trains[train_number-1]

    current_train.go_next_station
    p next_step
  end    

  def go_prev_station
    p "Choose train"
    trains.each.with_index(1) do |train, index| 
      p "#{index} - #{train.number}"
    end
    train_number = gets.chomp.to_i
    current_train = trains[train_number-1]

    current_train.go_prev_station
    p next_step
  end    

  def trains_at_station
    p "Choose station to view?"
    stations.each.with_index(1) do |st, index| 
      p "#{index} - #{st.station_name}"
    end
    station_to_view = gets.chomp.to_i
    current_station = stations[station_to_view-1]
    p current_station.list_of_train_in_station
    p next_step
  end

  def control_begin
    command_list
    loop do
    answer = gets.chomp.to_i    
    case answer
    when 1    #---------------------------------------------
      p "bay"
      break
    when 2    #---------------------------------------------
      p stations
      create_station
    when 3    #---------------------------------------------
      create_train
    when 4    #---------------------------------------------
      create_route
    when 5    #---------------------------------------------
      add_station_to_route
    when 6    #---------------------------------------------
      del_station_from_route
    when 7    #---------------------------------------------
      set_route_to_train
    when 8    #---------------------------------------------
      create_wagon
    when 9    #---------------------------------------------  
      add_wagon_to_train
    when 10   #---------------------------------------------  
      del_wagon_from_train
    when 11   #---------------------------------------------  
      go_next_station
    when 12   #---------------------------------------------  
      go_prev_station
    when 13
      p stations
    when 14
      trains_at_station
    when 15
      p trains
    when 16
      p wagons
    when 17
      
      

    end #case
    end #loop
  end

  def next_step
    "next step, please"
  end

  def command_list
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
    p "17. Просмотреть всю информацию"
  end

end