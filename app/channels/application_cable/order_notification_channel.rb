class ApplicationCable::OrderNotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "order_notifications"
  end
end