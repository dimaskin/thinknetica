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
require_relative 'passenger_train'
require_relative 'cargo_train'

#st1 = Station.new("st1")
#st2 = Station.new("st2")
#st3 = Station.new("st3")
#st4 = Station.new("st4")

pass_train1 = Passenger_Train.new("001")
p pass_train1
#train2 = Train.new("002","passenger",14)
#train3 = Train.new("003","passenger",19)
#train4 = Train.new("004","market",12)
#train5 = Train.new("005","market",120)

#route1 = Route.new(st1,st4)
#route2 = Route.new(st1,st3)
#route3 = Route.new(st1,st2)
#route4 = Route.new(st2,st3)

#train1.set_route(route1)
#train4.set_route(route2)

#route1.add_station(st3)
#route1.add_station(st2)
#p st1.train_in_station
#p route1.station_list
#route1.del_station(st2)
#p route1.station_list

#p train1.current_station
#train1.go_next_station
#p train1.current_station
#train1.go_next_station
#p train1.current_station
#train1.go_prev_station
#p train1.current_station

#st1.admission_train(train1)
#st1.admission_train(train4)

#st1.dispatch_train(train1)
#p "all train"
#st1.list_of_train_in_station
#p "pass train"
#st1.list_of_train_in_station("passenger")
#p "market train"
#st1.list_of_train_in_station("market")