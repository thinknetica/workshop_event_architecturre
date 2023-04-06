class RideRequested < ApplicationEvent
  attribute :ride_id, Types::UUID
end
