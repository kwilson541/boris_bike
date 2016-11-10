require 'docking_station'

describe DockingStation do

  it {is_expected.to respond_to (:release_bike)}

  it 'expects bike to be working' do
  	subject.docked_bikes << Bike.new
    bike = subject.release_bike
  	expect(bike.working?).to eq true
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it "expects bike to be docked" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.docked_bikes).to include(bike)
  end

  it "expects true if there is any bike in a docked_bike array" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.any_bikes_docked?).to eq true
  end

  it 'if docked_bikes is empty, expect release_bike to raise error' do
    docked_bikes = []
    expect {subject.release_bike}.to raise_error("There are no more bikes!")
  end

  it "docking station should only take one bike" do
    bike = Bike.new
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
    expect {subject.dock(bike)}.to raise_error("The docking station is full!")
  end

  it "new docking station instance must have a capacity instance variable" do
    station = DockingStation.new(6)
    expect(station.capacity).to eq 6
  end

  it "ensure default capacity of 20" do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "docking should not release a broken bike" do
    subject.docked_bikes << Bike.new(false)
    subject.docked_bikes << Bike.new(true)

    expect(subject.release_bike.condition).to eq true
  end

end
