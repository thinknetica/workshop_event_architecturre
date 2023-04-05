class RideRequestedHandler < ApplicationJob
  prepend RailsEventStore::AsyncHandler

  def perform(event)
    with_free_driver(event.data) do |driver_id|
      ride_id = event.data[:ride_id]
      Rails.configuration.event_store.with_metadata(ride_id: ride_id) do
        DriverRepository.new.with_driver(driver_id) do |driver|
          driver.offer_ride(Ride.find(ride_id))
        end
      end
    end
  end

  def with_free_driver(params)
    # ???
    yield 'fdcf526a-3fc6-4803-9ac5-0c3f47a5c825'
  end
end
