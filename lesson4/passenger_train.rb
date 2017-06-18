class Passenger_Train < Train
  def add_wagon(wagon)
    wagons << wagon if wagon.type == "pass"
  end
end