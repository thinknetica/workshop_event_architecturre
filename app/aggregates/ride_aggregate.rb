class RideAggregate
  include AggregateRoot

  def initialize
  end

  on RideRequested do |event|
    @id = event.data[:ride_id]
    @customer_id = event.data[:customer_id]
  end
end
