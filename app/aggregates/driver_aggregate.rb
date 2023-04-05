class DriverAggregate
  include AggregateRoot

  AlreadyOffered = Class.new(StandardError)

  def initialize(id)
    @id = id
    @state = :unknown
  end

  def offer_ride(ride)
    raise AlreadyOffered if @state == :considering

    apply RideOffered.new(data: { ride_id: ride.id })
  end

  def accept_ride(ride)
    apply RideAccepted.new(data: { driver_id: @id })
  end

  on RideOffered do |event|
    @state = :considering
  end

  on RideAccepted do |event|
    @state = :on_a_way
  end
end
