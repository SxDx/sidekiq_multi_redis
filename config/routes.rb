# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  #
  # pool_1 = ConnectionPool.new { Redis.new(url: ENV['OLD_REDIS_URL']) }
  # pool_2 = ConnectionPool.new { Redis.new(url: ENV['NEW_REDIS_URL']) }

  # mount Sidekiq::Web.with(redis_pool: pool_1), at: '/sidekiq1', as: 'sidekiq1'
  # mount Sidekiq::Web.with(redis_pool: pool_2), at: '/sidekiq2', as: 'sidekiq2'

  mount Sidekiq::Web, at: '/sidekiq'
end
