require "rails_helper"

RSpec.describe Cart do
  include Shoulda::Matchers::ActiveModel

  describe 'validations' do
    it { should have_many(:cart_products) }
  end

  describe 'scopes' do
    let!(:stale_carts) { create_list(:cart, 3, :stale) }

    it 'stale_carts' do
      expect(Cart.stale).to eq(stale_carts)
    end
  end
end