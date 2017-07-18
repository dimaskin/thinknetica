module Manufacturer
  def set_manufacturer(name)
    self.manufacturer = name
  end

  def get_manufacturer
    manufacturer
  end

  protected

  attr_accessor :manufacturer
end
