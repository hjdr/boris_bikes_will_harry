DockingStation = Class.new

class DockingStation

  attr_reader :available_bikes

  def initialize
    @available_bikes = []
  end

  def release_bike
    raise "No Bikes Available" if @available_bikes == [] 
    Bike.new
  end

  def receive_bike(bike)
    raise "Bike rack is full" if @available_bikes.length >= 1
    @available_bikes << bike
  end

end
