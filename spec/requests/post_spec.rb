require 'rails_helper'
require 'devise'

RSpec.describe "Posts", type: :request do

  describe "GET /index" do
    it "getting index page" do
      # user = User.create!(username: "test user", email: "test@mail.com", password: "123456")
      # post = create(:post)
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
    it "creating new post and redirect to post page" do
      get "/posts/new"
      expect(response).to render_template(:new)
      post = build(:post)
      post "/widgets", :params => { :post => post }
      # expect(post).to redirect_to post_path(post)
      expect(response).to redirect_to(assigns(:post))
      follow_redirect!
      expect(response).to render_template(:show)
    end

    it "does not render a different template" do
      get "/posts/new"
      expect(response).to_not render_template(:show)
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

    it "raise an error on accessing invalid id" do
      user = create(:user,id: 1000)
      expect { user }.to raise_error(ActiveRecord::RecordNotFound, "Accessing invalid id")
    end
  end

end
