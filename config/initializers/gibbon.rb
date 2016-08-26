Gibbon::Request.new(api_key: ENV["MAILCHIMP_API_KEY"])
Gibbon::Request.timeout=10
Gibbon::Request.throws_exceptions = true