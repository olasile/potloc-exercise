class ApplicationCable::InventoryMonitorChannel < ApplicationCable::Channel
  def subscribed
    unless self.current_admin.present?
      connection.transmit identifier: params, error: "Only signed in admins can monitor inventory levels"
      reject
    end

    stream_from "inventory_monitor"
  end
end