class PassengerTrain < Train
  def add_wagon(wagon)
    super if wagon.class.to_s == "PassengerWagon"
end