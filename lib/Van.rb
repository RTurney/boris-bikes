require_relative 'Garage'
class Van

  attr_accessor :storage

  def initialize
    @storage = []
  end

  def deliver_bikes(garage)
    @storage.length.times {garage.storage << @storage.pop}
  end

  def collect_bikes(garage)
    
  end

end
