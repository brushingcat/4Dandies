require 'rails_helper'

RSpec.describe SubscribeUserToMailingListJob, type: :job do
  fixtures :users
  let(:user) { user=users(:michael) }
  it "matches with enqueued job" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      SubscribeUserToMailingListJob.perform_later
    }.to have_enqueued_job(SubscribeUserToMailingListJob)
  end
end
