require 'bike'
describe Bike do
  it { is_expected.to respond_to "working?"}

  it 'can be reported as broken' do
    bike = Bike.new
    bike.report_as_broken
    expect(bike.working?).to be false
  end

end
