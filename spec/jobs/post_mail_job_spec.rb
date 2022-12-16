require 'rails_helper'

RSpec.describe PostMailJob, type: :job do
  describe "#perform_later" do
    it 'after ' do 
      post = create(:post)
      expect(PostMailer).to receive(:post_creation_mail)
      PostMailer.post_creation_mail(post)
    end
  end
end
