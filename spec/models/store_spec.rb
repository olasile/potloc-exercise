require "rails_helper"

RSpec.describe Store do
  include Shoulda::Matchers::ActiveModel

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should have_many(:products) }
  end
end