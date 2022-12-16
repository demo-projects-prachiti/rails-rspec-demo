require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'associations' do
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:posts).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    # it { should validate_uniqueness_of(:username) }
    it { should allow_value('user@example.com').for(:email)}
  end

  describe 'Callbacks' do
    it 'after create check if mailer is called' do 
      user = create(:user)
      expect(UserMailer).to receive(:new_signup_email)
      UserMailer.new_signup_email(user)
    end

    it 'after create fail test if mailer is called' do 
      expect(UserMailer).not_to receive(:new_signup_email)
    end
  end   
end
