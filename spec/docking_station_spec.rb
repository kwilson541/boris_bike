require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike }

  it {is_expected.to respond_to (:release_bike)}

  it {is_expected.to respond_to(:dock).with(1).argument}

  it "expects bike to be able to be docked" do
    subject.dock(bike)
    expect(subject.docked_bikes).to include(bike)
  end

  it "expects any_bikes_docked? to return true when a bike has been docked" do
    subject.dock(bike)
    expect(subject.any_bikes_docked?).to eq true
  end

  it 'if no bikes are docked, expect release_bike to raise error' do
    docked_bikes = []
    expect {subject.release_bike}.to raise_error("There are no more bikes!")
  end

  it 'docking station should not take bikes once it is at capacity' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
    expect {subject.dock(bike)}.to raise_error("The docking station is full!")
  end

  it 'new docking station instance must have a capacity instance variable' do
    station = DockingStation.new(6)
    expect(station.capacity).to eq 6
  end

  it 'ensure new docking station instance has a default capacity of 20' do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'docking should only release a working bike' do
    subject.docked_bikes << double(:bike, condition: false)
    subject.docked_bikes << double(:bike, condition: true)
    expect(subject.release_bike.condition).to eq true
  end

  it 'if no working bikes are docked, expect release_bike to raise error' do
    subject.docked_bikes << double(:bike, condition: false)
    expect {subject.release_bike}.to raise_error("There are no working bikes!")
  end

end
