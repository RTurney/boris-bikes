require_relative 'Garage'

class Van

  attr_accessor :storage

  def initialize
    @storage = []
  end

  def deliver_bikes(garage)
    @storage.length.times {garage.storage << @storage.pop} # is there a more efficient way of doing this? I rather like it but I feel like there should be a way to unload them all at once
  end

  def collect_bikes(garage)
    
  end

end
