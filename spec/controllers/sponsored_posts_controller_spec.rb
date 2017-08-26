require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit
      expect(response).to render_template :edit
    end
        
    it "assigns sponsored_posts to be update to @topic" do
      get :edit
      sponsored_posts = assigns(:sponsored_posts)
      expect(sponsored_posts.id).to eq my_topic.id
      expect(sponsored_posts.name).to eq my_topic.name
      expect(sponsored_posts.description).to eq my_topic.description
    end
  end

end
