require "./lib/boris_bikes.rb"

describe Bike do
  it "Responds to a method called working?" do
  expect(Bike.new).to respond_to(:working?)
  end

  


end
