DockingStation = Class.new

class DockingStation

  attr_accessor :available_bikes, :capacity
  DEFAULT_CAPACITY = 20 

  def initialize(capacity=DEFAULT_CAPACITY)
    @available_bikes = []
    @capacity = capacity
  end

  def release_bike
    no_bikes? ? raise("No Bikes Available") : @available_bikes.pop
  end

  def receive_bike(bike)
    full? ? raise("Bike rack is full") : @available_bikes << bike
  end

private

  def full?
   @available_bikes.length >= DEFAULT_CAPACITY
  end

  def no_bikes?
    @available_bikes.empty?
  end

end