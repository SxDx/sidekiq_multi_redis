use_new_redis = ENV['USE_REDIS'] == 'new'

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['OLD_REDIS_URL'] }
end

if use_new_redis
  puts 'Using new redis'
  Sidekiq.configure_server do |config|
    config.redis = { url: ENV['NEW_REDIS_URL'] }
  end
else
  puts 'Using old redis'
  Sidekiq.configure_server do |config|
    config.redis = { url: ENV['OLD_REDIS_URL'] }
  end
end
