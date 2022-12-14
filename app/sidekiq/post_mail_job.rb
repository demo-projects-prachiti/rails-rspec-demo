class PostMailJob
  include Sidekiq::Job
  queue_as :default

  def perform(*args)
    PostMailer.post_creation_mail()
  end
end
