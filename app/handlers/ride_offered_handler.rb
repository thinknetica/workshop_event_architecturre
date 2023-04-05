class RideOfferedHandler
  def call(event)
    driver = Driver.find(event.data[:driver_id])
    OffersChannel.broadcast_to(driver, ride: { id: event.data[:ride_id] })
  end
end
