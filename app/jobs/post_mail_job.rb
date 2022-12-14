class PostMailJob < ApplicationJob
  # include Sidekiq::Job
  queue_as :default

  def perform(post)
    PostMailer.post_creation_mail(post).deliver_now
  end
end