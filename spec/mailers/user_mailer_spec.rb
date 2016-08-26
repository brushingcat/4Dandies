require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome_email" do
    fixtures :users
    let(:user) { user=users(:michael) }
    let(:mail) { UserMailer.welcome_email(user).deliver_now }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to 4")
      expect(mail.to).to eq(["michael@example.com"])
      expect(mail.from).to eq(["noreply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
