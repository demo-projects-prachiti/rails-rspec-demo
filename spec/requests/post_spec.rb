require 'rails_helper'
require 'devise'

RSpec.describe "Posts", type: :request do

  let(:user) {
    FactoryBot.create(:user)
  }

  let(:valid_attributes) {
    FactoryBot.attributes_for(:post,user:user)
  }

  let(:invalid_attributes) {
    {
    title: "Title for testing",
    context: "Invalid attribute"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      sign_in user
      post = create(:post,user: user)
      get posts_url
      expect(response).to render_template(:index)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      sign_in user
      get new_post_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      sign_in user
      post = create(:post,user: user) 
      get post_url(post)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      sign_in user
      post = create(:post,user: user) 
      get edit_post_url(post)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Post" do
        sign_in user
        expect {
          post posts_url, params: {:post => valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        sign_in user
        post posts_url, params: { :post => valid_attributes }
        expect(response).to redirect_to(post_url(Post.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Article" do
        expect {
          post posts_url, params: { :post => invalid_attributes }
        }.to change(Post, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post posts_url, params: { :post => invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested post" do
      sign_in user
      post = create(:post,user: user)
      expect {
        delete post_url(post)
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the root path" do
      sign_in user
      post = create(:post,user: user)
      delete post_url(post)
      expect(response).to redirect_to(root_url)
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:updated_attributes) {
        {
          title: 'A New Post Title',
          description: 'A New Post Description',
          user_id: user.id
        }
      }

      it "updates the requested post" do       
        sign_in user
        post = create(:post,user: user)
        patch post_url(post), params: { :post => updated_attributes}
        post.reload
      end

      it "redirects to the post" do
        sign_in user
        post = create(:post,user: user)
        patch post_url(post), params: { :post => updated_attributes }
        post.reload
        expect(response).to redirect_to(post_url(post))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        sign_in user
        post = create(:post,user: user)
        patch post_url(post), params: { post: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end
end
