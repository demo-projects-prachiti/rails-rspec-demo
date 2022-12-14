class PostsController < ApplicationController
	require "active_merchant"
	def index
		@posts = Post.order(created_at: :desc).includes(:user)
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.new(post_params)		
	    if @post.save
	    	PostMailJob.perform_later(@post)
	   	  	redirect_to @post
	    else
	      render :new
	    end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
    	@post = Post.find(params[:id])
		if @post.update(post_params)
  		redirect_to @post
		else
	  		render :edit
		end
		end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end

	def like 
		@post = Post.find(params[:id])
		Like.create(user_id: current_user.id,post_id: @post.id)
		redirect_to post_path(@post)
	end

	def payment
		@post = Post.find(params[:id])
		# # gateway = ActiveMerchant::Billing::PaypalGateway.new

		gateway = ActiveMerchant::Billing::PaypalGateway.new(
	        :login => Rails.application.credentials.PAYPAL[:PAYPAL_LOGIN],
	        :password => Rails.application.credentials.PAYPAL[:PAYPAL_PASSWORD],
	        :signature => Rails.application.credentials.PAYPAL[:PAYPAL_SIGNATURE])
		# ActiveMerchant accepts all amounts as Integer values in cents
		amount = 1000 # $10.00

		# The card verification value is also known as CVV2, CVC2, or CID
		credit_card = ActiveMerchant::Billing::CreditCard.new(
			:first_name         => 'John',
			:last_name          => 'Doe',
			:number             => '4032033915654086',
			:month              => '05',
			:year               => '2027',
			:verification_value => '000',
			:brand              => 'VISA')	
		# Validating the card automatically detects the card type
		if credit_card.validate.empty?
		# Capture $10 from the credit card
			response = gateway.purchase(amount,credit_card)

			if response.success?
				puts "Successfully charged to the credit card #{credit_card.display_number}"
			else
				raise StandardError, response.message
			end
		else
			puts "card is invalid"
		end
	 	# paypal_response = gateway.setup_purchase(
	#    (amount * 100).round, # paypal amount is in cents
	#    ip: request.remote_ip,
	#    return_url: post_path(@post), # return here if payment success
	#    cancel_return_url: root_path# return here if payment failed
	#  )
	#  redirect_to ::GATEWAY.redirect_url_for(paypal_response.token) and return 
	end
	private
	def post_params
		params.require(:post).permit(:title, :description, :avatar, :user_id, category_ids: [])
	end
end