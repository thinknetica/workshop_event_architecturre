module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :driver

    def connect
      self.driver = Driver.find(request.headers['x-driver-id'])
    rescue
      reject_unauthorized_connection
    end
  end
end
