class CargoWagon < Wagon
  private
  #по условиям тип вагона = его класс, значит достапа извне к типу вагона не будет
  def initialize()
    #@type = "cargo"
  end
end