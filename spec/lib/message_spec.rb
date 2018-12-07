require_relative '../../app/lib/message'

RSpec.describe Message do

  describe 'The singleton methods' do
    it 'has a not found method' do
      expect(Message.not_found).to eq "Sorry, record not found."
    end

    it 'has a unauthorized method' do
      expect(Message.unauthorized).to eq 'Unauthorized request'
    end

    it 'has a account not created method' do
      expect(Message.account_not_created).to eq 'Account could not be created'
    end

    it 'has an expired token method' do
      expect(Message.expired_token).to eq 'Sorry, your token has expired. Please login to continue.'
    end
  end
end
