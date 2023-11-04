require "rails_helper"

describe 'CartProducts' do
  describe 'update' do
    let(:cart) { create(:cart) }
    let(:cart_product) { create(:cart_product, cart: cart) }

    it 'updates a cart product successfully' do
      allow_any_instance_of(ApplicationController).to receive(:session) { { cart_id: cart.id } }

      put cart_product_path(cart_product.id), params: {
        id: cart_product.id,
        cart_product: {
          quantity: 5
        }
      }, xhr: true

      expect(response).to have_http_status(:ok)
      expect(cart_product.reload.quantity).to eq(5)
    end
  end
end