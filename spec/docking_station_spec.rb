require 'docking_station'

describe DockingStation do
  
  it {is_expected.to respond_to (:release_bike)}

  it 'expects bike to be working' do
  	bike = subject.release_bike
  	expect(bike.working?).to eq true
  end

end
