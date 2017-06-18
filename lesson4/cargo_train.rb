class Cargo_Train < Train
  def add_wagon(wagon)
    wagons << wagon if wagon.type == "cargo"
  end
end