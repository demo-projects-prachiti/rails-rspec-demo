class UserMailer < ApplicationMailer
	def new_signup_email(user)
		mail(to: user.email, subject: "Welcome to Neoblog", from: "neosofttech.com")
	end
end
