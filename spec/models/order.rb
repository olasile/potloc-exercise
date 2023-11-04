require "rails_helper"

RSpec.describe Order do
  include Shoulda::Matchers::ActiveModel

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it do
      should_not allow_value("123456").for(:password).with_message("password length must be within 8 to 40 characters")
    end

    it do
      should_not allow_value("a12345678").for(:password).with_message("password must have at least one lowercase character, one uppercase character, one digit, and one special character")
    end

    it { should allow_value("^GzM,@*50rCm").for(:password) }

    it 'ensures a unique username' do
      create(:user, username: 'user1', password: '^GzM,@*50rCm')
      user2 = build(:user, username: 'user1', password: '4nL&ax@GFt')

      expect(user2.valid?).to be_falsey
      expect(user2.errors.messages[:username]).to eq(['username is taken'])
    end
  end
end