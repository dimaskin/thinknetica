class CargoWagon < Wagon
  attr_reader :volume, :wagon_load, :free_volume
  def initialize(volume = 100)
    @volume      = volume
    @wagon_load  = 0
    @free_volume = volume
  end

  def hold_volume(volume_to_hold)
    return unless @free_volume >= volume_to_hold
    @wagon_load += volume_to_hold
    free_volume
  end

  def free_volume
    @free_volume = @volume - @wagon_load
  end
end
