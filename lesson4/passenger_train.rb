class PassengerTrain < Train
  def add_wagon(wagon)
  	#если метод super выполняет его сначала в родительском классе, то как добавить условие по типу вагона? переписать его совсем?
    wagons << wagon if wagon.class.to_s == "PassengerWagon" && @speed == 0
  end
end