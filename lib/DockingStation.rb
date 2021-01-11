require_relative 'Bike'
require_relative 'Van'

class DockingStation
  # nicely laid out code
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

# too many spaces here though! max one empty line at a time

  def release_bike
    raise "There is no bike" if empty?
    raise "This bike is broken and cannot be released" if !@bikes[-1].working? # checks if the last bike entered is broken.
    # what if a broken bike is docked followed by a working one, does the working one still get released?
    
    @bikes.pop # here you refer to the instance variable @bikes.
    # Since you have the getter method/attr_reader method bikes, use that. Better to use instance methods than variables
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
    bikes.empty? # here you correctly used the bikes method instead of @bikes! :)
  end

end
