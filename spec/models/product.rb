require "rails_helper"

RSpec.describe Product do
  include Shoulda::Matchers::ActiveModel

  describe 'validations' do
    it { should belong_to(:store) }
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:available).is_greater_than_or_equal_to(0) }
  end
end