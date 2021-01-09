require_relative 'Bike'
class DockingStation

  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def release_bike
    raise "There is no bike" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "This station is full" if full?
    @bikes << bike
  end

  private
  def full?
    @bikes.length >= 20 
  end

  def empty?
    bikes.empty?
  end

end
