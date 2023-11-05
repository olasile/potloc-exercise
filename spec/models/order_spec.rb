require "rails_helper"

RSpec.describe Order do
  include Shoulda::Matchers::ActiveModel

  describe 'validations' do
    it { should have_many(:order_products) }
  end
end