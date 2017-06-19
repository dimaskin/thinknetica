class CargoTrain < Train
  def add_wagon(wagon)
    #wagons << wagon if wagon.type == "cargo"
    wagons << wagon if wagon.class.to_s == "CargoWagon" && @speed == 0
  end
end