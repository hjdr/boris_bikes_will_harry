DockingStation = Class.new

class DockingStation

  attr_reader :available_bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @available_bikes = []
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