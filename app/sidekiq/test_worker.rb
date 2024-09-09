# frozen_string_literal: true

class TestWorker
  include Sidekiq::Job

  def perform(*args)
    puts "Performing TestWorker with args: #{args}"
  end

  def self.perform_async_on_new_cluster(*args)
    NEW_REDIS.with do |conn|
      Sidekiq::Client.new(conn).push('class' => self, 'args' => args, 'queue' => 'default')
    end
  end
end
