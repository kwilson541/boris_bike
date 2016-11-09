class DockingStation

attr_reader :bike

  def release_bike
  raise "No more bikes!" unless @bike
  Bike.new
  end

  def return_bike(bike)
    if self.bike != nil
      raise "Docking station is full!"
    else
      @bike = bike
    end
  end

end

class Bike

  def working?
    true
  end

end
