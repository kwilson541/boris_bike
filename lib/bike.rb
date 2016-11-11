class Bike
attr_reader :status

  def initialize(status = true)
  @status = status
  end

  def working?
    @status
  end
  def report_as_broken
    @status = false
  end
end
