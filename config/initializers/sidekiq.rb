#Sidekiq.configure_server do |config|
#  config.redis = { url: ENV['REDIS_URL'] }
#end

#Sidekiq.configure_client do |config|
#  config.redis = { url: ENV['REDIS_URL'] }
#end


#SIDEKIQ CONFIGURATION
#https://github.com/jollygoodcode/jollygoodcode.github.io/issues/12
require 'sidekiq_calculations'

Sidekiq.configure_client do |config|
  sidekiq_calculations = SidekiqCalculations.new
  sidekiq_calculations.raise_error_for_env!

  config.redis = {
      url: ENV['REDISCLOUD_URL'],
      size: sidekiq_calculations.client_redis_size
  }
end

Sidekiq.configure_server do |config|
  sidekiq_calculations = SidekiqCalculations.new
  sidekiq_calculations.raise_error_for_env!

  config.options[:concurrency] = sidekiq_calculations.server_concurrency_size
  config.redis = {
      url: ENV['REDIS_URL']
  }
end