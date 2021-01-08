require_relative 'Bike'
class DockingStation

  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def release_bike
    raise "There is no bike" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    if @bikes.length == 20
      raise "This station is full"
    end
    @bikes << bike
  end

end
