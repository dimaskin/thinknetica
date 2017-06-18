class Passenger_Wagon < Wagon
  private
  #по условиям тип вагона = его класс, значит достапа извне к типу вагона не будет
  def initialize()
    @type = "pass"
  end
end