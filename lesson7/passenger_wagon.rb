class PassengerWagon < Wagon

  attr_reader :place_count, :place_busy

  def initialize (place_count)
  	@place_count = place_count
    @place_busy  = 0
  end

  def take_place
    @place_busy += 1 if @place_count > @place_busy
  end
end