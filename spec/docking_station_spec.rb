require 'docking_station'

describe DockingStation do

	it { is_expected.to respond_to(:release_bike) }

	it 'bike should be working' do
		bike = Bike.new
		expect(bike.working?).to eq true
	end

end
