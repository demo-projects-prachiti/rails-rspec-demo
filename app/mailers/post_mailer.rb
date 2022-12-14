class PostMailer < ApplicationMailer
  
  def post_creation_mail(post)
  	mail(to: post.user.email, subject: "Welcome to Neoblog", from: "neosofttech.com")
  end
end
