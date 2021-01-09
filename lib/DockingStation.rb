require_relative 'Bike'
class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end



  def release_bike
    raise "There is no bike" if empty?
    raise "This bike is broken and cannot be released" if !@bikes[-1].working?
    @bikes.pop
  end

  def dock(bike)
    raise "This station is full" if full?
    @bikes << bike
  end

  private
  def full?
    @bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end

end
