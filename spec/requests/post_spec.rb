require 'rails_helper'
require 'devise'

RSpec.describe "Posts", type: :request do

  describe "GET /index" do
    it "getting index page" do
      user = User.create!(username: "test user", email: "test@mail.com", password: "123456")
      # post = Post.create!(title: "Test title",description: "Test Description",user: user)
      post = create(:post)
      get posts_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "getting new page" do
      @post = Post.new
      get new_post_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    it "creating new post" do
      # user = User.create!(username: "test user", email: "test@mail.com", password: "123456")
      # @post = Post.create!(title: "Test title",description: "Test Description",user: user) 
      post = create(:post)
      # create(:user) do |user|
      #   user.posts.create(attributes_for(:post))
      # end
      # expect do
      #   post :create,params: {post: post}
      # end
      # post :create,post: @post
      # post posts_path, params: post
      # post posts_url(post) 
      # post.save
        # expect(response).to redirect_to @post
        # get post_url(@post)
        redirect_to post_path(post)
    end
  end

  describe "GET /show" do
    it "getting show page" do
      user = User.create!(username: "test user", email: "test@mail.com", password: "123456")
      @post = Post.create!(title: "Test title",description: "Test Description",user: user) 
      sign_in user
      get post_url(@post)

      expect(response).to be_successful
    end
  end

end
