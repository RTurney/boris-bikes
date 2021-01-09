require_relative 'Bike'
require_relative 'Van'

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

  def provide_broken_bike(van)
    bikes.each.with_index do |bike, index|
      if !bike.working?
        van.storage << bike
        bikes.delete_at(index)
      end
    end
  end

  private
  def full?
    @bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end

end
