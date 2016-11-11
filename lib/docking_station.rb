require_relative 'bike'
class DockingStation
attr_reader :bikes, :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    empty?
    bike = @bikes.index{|bike| bike.status == true}
    fail "No working bikes available." if bike.nil?
    @bikes.slice!(bike)
  end

  def dock_bike(bike)
    @bikes << bike unless full?
  end

  private

  def full?
    fail "The dock is full." if @bikes.length >= @capacity
  end
  def empty?
    fail "No bikes available" if @bikes.empty?
  end

end
