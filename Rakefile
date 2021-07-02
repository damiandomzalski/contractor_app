# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'sneakers/tasks'

Rails.application.load_tasks

namespace :rabbitmq do
  desc 'Setup routing'
  task :setup do
    require 'bunny'

    conn = Bunny.new
    conn.start

    ch = conn.create_channel

    x = ch.fanout('contractor_app.payment_requests')

    queue = ch.queue('manager_app.payment_requests', durable: true)

    queue.bind('contractor_app.payment_requests')

    conn.close
  end
end
