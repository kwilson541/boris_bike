require 'docking_station'

describe DockingStation do

  it {is_expected.to respond_to (:release_bike)}

  it 'expects bike to be working' do
  	bike = subject.release_bike
  	expect(bike.working?).to eq true
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it "expects bike to be docked" do
    bike = subject.release_bike
    subject.dock(bike)
    expect(subject.docked_bikes).to include(bike)
  end

  it "expects true if there is any bike in a docked_bike array" do
    bike = subject.release_bike
    subject.dock(bike)
    expect(subject.any_bikes_docked?).to eq true
  end
end
