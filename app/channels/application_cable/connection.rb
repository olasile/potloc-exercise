# app/channels/application_cable/connection.rb
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    def connect
      logger.add_tags 'ActionCable'
    end
  end
end
