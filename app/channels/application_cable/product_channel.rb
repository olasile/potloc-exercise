class ApplicationCable::ProductChannel < ApplicationCable::Channel
  def subscribed
    stream_from "products"
  end
end