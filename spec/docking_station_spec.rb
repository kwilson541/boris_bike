require 'docking_station'

describe DockingStation do

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'can have a custom capacity' do
    docking_station = DockingStation.new(5)
    expect(docking_station.capacity).to eq 5
  end

  describe '#dock_bike' do
    it "creates an instance of class Bike" do
      bike = subject.dock_bike(Bike.new)
    end

    it 'checks that it docks a bike' do
      bike = Bike.new
      expect(subject.dock_bike(bike)).to include bike
    end

    it 'stops bikes being docked if the dock is full' do
      subject.capacity.times {subject.dock_bike Bike.new}
      expect{subject.dock_bike(Bike.new)}.to raise_error("The dock is full.")
    end
  end

  describe '#release_bike' do
    it 'can release a bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
  end
    it 'only releases bike when there is a bike available' do
      expect{subject.release_bike}.to raise_error("No bikes available")
    end
  end
    it 'does not release broken bikes' do
      bike = Bike.new(false)
      subject.dock_bike(bike)
      expect{subject.release_bike}.to raise_error("No working bikes available.")
    end




end
