class PassengerTrain < Train
  def add_wagon(wagon)
    wagons << wagon if wagon.class.to_s == "PassengerWagon" && @speed == 0
  end
end