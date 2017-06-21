class PassengerTrain < Train
  def add_wagon(wagon)
    #super if wagon.class == PassengerWagon
    super if wagon.is_a? PassengerWagon
  end
end