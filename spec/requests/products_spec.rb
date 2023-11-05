require "rails_helper"

describe 'Products' do
  describe 'index' do
    let(:store) { create(:store) }
    let!(:products) { create_list(:product, 25, store: store) }

    it 'lists products' do
      get products_path

      expect(assigns(:products)).to eq(products)
      expect(response).to render_template(:index)
    end
  end
end