module Manufacturer
  def establish_manufacturer(name)
    self.manufacturer = name
  end

  def receive_manufacturer
    manufacturer
  end

  protected

  attr_accessor :manufacturer
end
