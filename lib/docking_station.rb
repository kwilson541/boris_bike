require './lib/bike.rb'

class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
  	Bike.new
  end

  def dock(new_bike)
    @docked_bikes << new_bike
  end

  def any_bikes_docked?
    @docked_bikes.any?
  end
end
