require "rails_helper"

RSpec.describe Admin do
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

  describe 'methods' do
    let(:user) { create(:user) }

    it 'as_json' do
      expect(user.as_json).to eq({ username: user.username })
    end

    describe 'save' do
      it 'saves a user successfully' do
        user = build(:user, username: 'user1')
        expect(user.save).to eq('OK')
      end

      it 'does not save an invalid user' do
        user = build(:user, username: 'user1', password: '')
        expect { user.save }.to raise_error(ActiveModel::ValidationError)
      end
    end

    describe 'authenticate' do
      it 'successfully authenticates with valid credentials' do
        expect(User.authenticate(user.username, '4nL&ax@GFt')).to be_truthy
      end

      describe 'fails to authenticate' do
        it 'with invalid username' do
          expect(User.authenticate('invalid_username', '4nL&ax@GFt')).to be_falsey
        end

        it 'with invalid password' do
          expect(User.authenticate(user.username, 'invalid_password')).to be_falsey
        end
      end
    end
  end
end