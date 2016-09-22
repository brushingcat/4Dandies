require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome_email" do
    fixtures :users
    let(:user) { user=users(:michael) }
    let(:mail) { UserMailer.welcome_email(user).deliver_now }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to 4DANDIES")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["welcome@4dandies.com"])
    end


  end
end

include ActiveJob::TestHelper

RSpec.describe "Sending welcome email", :type => :request do
  fixtures :users
  let(:user) { user=users(:michael) }

  it 'job is created' do
    ActiveJob::Base.queue_adapter = :test
    expect{
      UserMailer.welcome_email(user).deliver_later
    }.to have_enqueued_job.on_queue('mailers')
  end

  it 'welcome_email is sent' do
    expect {
      perform_enqueued_jobs do
        UserMailer.welcome_email(user).deliver_later
      end
    }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end

  it 'welcome_email is sent to the right user' do
    perform_enqueued_jobs do
      UserMailer.welcome_email(user).deliver_later
    end

    mail = ActionMailer::Base.deliveries.last
    expect(mail.to[0]).to eq user.email
  end
end

