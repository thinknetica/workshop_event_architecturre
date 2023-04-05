class ApplicationController < ActionController::API
  def current_user
    @current_user ||= User.find(request.headers['x-user-id'])
  end

  def event_store
    Rails.configuration.event_store
  end
end
