OLD_REDIS = ConnectionPool.new(size: 5, timeout: 5) do
  Redis.new(url: ENV['OLD_REDIS_URL'])
end

NEW_REDIS = ConnectionPool.new(size: 5, timeout: 5) do
  Redis.new(url: ENV['NEW_REDIS_URL'])
end
