require 'rails_helper'

RSpec.describe PostMailJob, type: :job do
  describe "#perform_later" do
    it "Create a Post" do
      ActiveJob::Base.queue_adapter = :test
      post = create(:post)
      expect {
        PostMailJob.perform_now(post)
      }.to have_enqueued_job
    end
  end
end
