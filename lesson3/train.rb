#Класс Train (Поезд):
#Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
#Может набирать скорость
#Может возвращать текущую скорость
#Может тормозить (сбрасывать скорость до нуля)
#Может возвращать количество вагонов
#Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). 
#Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
#Может принимать маршрут следования (объект класса Route). 
#При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
#Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
#Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
class Train

  attr_accessor :speed, :current_station
  attr_reader   :wagon_count, :route, :type

  def initialize(number, type, wagon_count)
    @number = number
    @type = type
    @wagon_count = wagon_count
  end

  def change_wagon_count(operation)
    if @speed == 0
      if operation == "add"
        @wagon_count += 1
      elsif operation =="del"
        @wagon_count -= 1
      else
        p "what operation?"
      end
    end
  end

  def set_route(route)
    @route = route
    @current_station = route.station_list[0]
    @current_station.admission_train(self)
  end

  def go_next_station
    #prev_station
    next_station = @route.station_list[@route.station_list.index(@current_station)+1]
  end

  def go_prev_station
    @current_station = @route.station_list[@route.station_list.index(@current_station)-1]
  end


end