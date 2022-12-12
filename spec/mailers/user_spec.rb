require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) {FactoryBot.create(:user)}
  let(:mail) { UserMailer.new_signup_email(user) }
  describe "welcome_email" do
    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to Neoblog")
      # expect(mail.to).to eq(["to@example.org"])
      # expect(mail.from).to eq(["from@example.com"])
    end

    # it "renders the body" do
    #   expect(mail.body.encoded).to match("Hi")
    # end
  end
end
