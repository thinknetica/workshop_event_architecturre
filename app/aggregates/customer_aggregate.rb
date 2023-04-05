class CustomerAggregate
  include AggregateRoot

  AlreadyRequested = Class.new(StandardError)

  def initialize(id)
    @id = id
    @state = :unknown
  end

  def request_ride(ride_id, params)
    raise AlreadyRequested if @state == :wating_car # params.hash == @params_hashww

    apply RideRequested.new(data: { ride_id: ride_id, customer_id: @id })
  end

  on RideRequested do |event|
    @state = :wating_car
    @params_hash = event.data[:params].hash
  end
end
