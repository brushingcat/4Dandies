class SubscribeUserToMailingListJob < ApplicationJob
  queue_as :default

  def perform(user)
    gibbon=Gibbon::Request.new
    hash=Digest::MD5.hexdigest(user.email)
    gibbon.lists(ENV["MAILCHIMP_LIST_ID"]).members(hash).upsert(body:
                                                              {email_address:
                                                                   user.email,
                                                status: "subscribed"})
  end
end
