require 'docking_station'

describe DockingStation do

  let(:bike) {double :bike}

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'can have a custom capacity' do
    docking_station = DockingStation.new(5)
    expect(docking_station.capacity).to eq 5
  end

  describe '#dock_bike' do

    it 'checks that it docks a working bike' do
      bike = double(:bike, :status => true)
      expect(subject.dock_bike(bike).any? {|bike| bike.status == true}).to be true
    end

    it 'checks that it docks a broken bike' do
      bike = double(:bike, :status => false)
      expect(subject.dock_bike(bike).any? {|bike| bike.status == false}).to be true
    end

    it 'stops bikes being docked if the dock is full' do
      subject.capacity.times {subject.dock_bike(bike)}
      expect{subject.dock_bike(bike)}.to raise_error("The dock is full.")
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = double(:bike, :status => true)
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
  end
    it 'only releases bike when there is a bike available' do
      expect{subject.release_bike}.to raise_error("No bikes available")
    end
  end
    it 'does not release broken bikes' do
      bike = double(:bike, :status => false)
      subject.dock_bike(bike)
      expect{subject.release_bike}.to raise_error("No working bikes available.")
    end




end
