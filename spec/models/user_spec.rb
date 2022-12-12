require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'associations' do
    it { should have_many(:likes).dependent(:destroy) }
    # it { should have_many(:posts).through(:likes) }
    it { should have_many(:posts).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    # it { should validate_uniqueness_of(:username) }
    it { should allow_value('user@example.com').for(:email)}
  end

  # describe 'Callbacks' do
  #   it 'before create' do 
  #     user = create(:user)
  #     # expect { user.new_signup_email }.to change { ActionMailer::Base.deliveries.count }.by(1)
  #     expect(user_mailer).to receive(:new_signup_email).with(user)
  #   end
  # end   
end
