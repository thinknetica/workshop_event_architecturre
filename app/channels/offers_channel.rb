class OffersChannel < ApplicationCable::Channel
  def subscribed
    stream_for driver
  end
end
