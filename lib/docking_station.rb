require './lib/bike.rb'

class DockingStation
  attr_reader :docked_bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
  	raise "There are no more bikes!" if empty?
    index = @docked_bikes.index {|bike| bike.condition == true }
    @docked_bikes.slice!(index)
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
      @docked_bikes.count >= DEFAULT_CAPACITY
    end

    def empty?
      @docked_bikes.empty?
    end

end
