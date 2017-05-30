require './station.rb'
require './route.rb'
require './train.rb'


st1 = Station.new("st1")
st2 = Station.new("st2")
st3 = Station.new("st3")
st4 = Station.new("st4")

train1 = Train.new("001","passenger",10)
train2 = Train.new("002","passenger",14)
train3 = Train.new("003","passenger",19)
train4 = Train.new("004","market",12)
train5 = Train.new("005","market",120)

route1 = Route.new(st1,st4)
route2 = Route.new(st1,st3)
route3 = Route.new(st1,st2)
route4 = Route.new(st2,st3)

train1.set_route(route1)
train4.set_route(route2)

route1.add_station(st3)
route1.add_station(st2)
p st1.train_in_station
#p route1.station_list
#route1.del_station(st2)
#p route1.station_list

p train1.current_station
train1.next_station
p train1.current_station
train1.next_station
p train1.current_station
train1.prev_station
p train1.current_station

st1.admission_train(train1)
st1.admission_train(train4)

st1.dispatch_train(train1)
#p "all train"
#st1.list_of_train_in_station
#p "pass train"
#st1.list_of_train_in_station("passenger")
#p "market train"
#st1.list_of_train_in_station("market")