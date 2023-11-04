require "rails_helper"

RSpec.describe OrderProduct do
  include Shoulda::Matchers::ActiveModel

  describe 'validations' do
    it { should belong_to(:order) }
    it { should belong_to(:product) }
    it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(1) }
  end

  describe 'callbacks' do
    it { is_expected.to callback(:update_product_inventory).after(:create) }
  end
end