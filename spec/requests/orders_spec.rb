require "rails_helper"

describe 'Orders' do
  describe 'create' do
    let(:cart) { create(:cart, :with_products) }

    it 'creates an order successfully' do
      allow_any_instance_of(ApplicationController).to receive(:session) { { cart_id: cart.id } }

      expect { post orders_path }.to change { Order.count }.by(1)
    end
  end

  describe 'index' do
    let!(:orders) { create_list(:order, 3, :with_order_products) }

    it 'lists orders' do
      get orders_path

      expect(assigns(:orders).to_a).to eq(orders)
      expect(response).to render_template(:index)
    end
  end
end