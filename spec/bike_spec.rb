require 'bike'
describe Bike do
  it {is_expected.to respond_to :working?}

  it "bikes should have a condition status" do
    bike = Bike.new(true)
    expect(bike.condition).to eq true
  end

end
