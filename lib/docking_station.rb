require './lib/bike.rb'

class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
  	raise "There are no more bikes!" if empty?
    @docked_bikes.pop
  end

  def dock(new_bike)
    raise "The docking station is full!" if full?
    @docked_bikes << new_bike
  end

  def any_bikes_docked?
    @docked_bikes.any?
  end

  private
    def full?
      @docked_bikes.count >= 20
    end

    def empty?
      @docked_bikes.empty?
    end

end
