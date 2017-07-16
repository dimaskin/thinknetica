class PassengerWagon < Wagon

  attr_reader :place_count, :place_busy

  def initialize (place_count=100)
  	@place_count = place_count
    @place_busy  = 0
  end

  def take_place
    @place_busy += 1 if @place_count > @place_busy
    #тут я не понял замечания, занимаю 1 место пока количество мест больше занятых. 
    #@place_count = 100, и не меняется
    #если @place_busy = 50, то @place_count > @place_busy будет работать (100 > 50)
  end
end