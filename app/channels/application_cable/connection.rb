# app/channels/application_cable/connection.rb
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_admin

    def connect
      self.current_admin = Admin.find_by(id: cookies.signed[:admin_id])
      logger.add_tags 'ActionCable'
    end
  end
end
