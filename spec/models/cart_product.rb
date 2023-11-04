require "rails_helper"

RSpec.describe CartProduct do
  include Shoulda::Matchers::ActiveModel

  describe 'validations' do
    it { should belong_to(:cart) }
    it { should belong_to(:product) }
    it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(1) }
  end
end