class RideModelHandler
  def call(event)
    case event
    when RideRequested then Ride.create(id: event.data[:ride_id], user_id: event.data[:customer_id])
    when RideAccepted  then Ride.find(event.data[:ride_id]).update(driver_id: event.data[:driver_id])
    end
  end
end
