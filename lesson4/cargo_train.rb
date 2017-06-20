class CargoTrain < Train
  def add_wagon(wagon)
    super if wagon.class.to_s == "CargoWagon"
  end
end