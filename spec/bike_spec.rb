require 'bike'
describe Bike do
  it {is_expected.to respond_to :working?}

  it "bikes should have a condition status" do
    bike = Bike.new(true)
    expect(bike.condition).to eq true
  end

  it "the condition of the bike can be changed" do
    bike = Bike.new(true)
    bike.report_broken
    expect(bike.condition).to eq false
  end

end
