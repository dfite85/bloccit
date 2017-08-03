require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_post] to @posts" do
      get :index
      expect(assigns(:posts)).to eq([my_post])
    end
  end
  
  describe "GET new" do
    it "returns https success" do
      get :new                                                                  #when new is invoked a new and unsaved Post obj is created
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do                                               #verifies that the new renders the correct template
      get :new
      expect(response).to render_template :new                                  #Questions for k-dog, why is there now () around : new here
    end
    
    it "instantiates @post" do                                                  #expect the @post inst var to be init by PostsContrller#new and assings gives us access to the @post var assiningin it to :post
      get :new
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe "Post create" do
    
    it "increases the number of Post by 1" do                                   #expect after PostsContorller#create is called wih parm the ocunt will increase by one
      expect{post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
    end
    
    it "assigns the new post to @post" do                                       #when create is posted we expect post to be assinged to @post
      post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:post)).to eq Post.last
    end
    
    it "redirects to the new post" do                                           #expect to be redirected to the new post
      post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to Post.last
    end
  end
  
  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_post.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, {id: my_post.id}
      expect(response).to render_template :show
    end
    
    it "assigns my_post to @post" do
      get :show, {id: my_post.id}
      expect(assigns(:post)).to eq(my_post)
    end
  end
end
  
    
  
=begin                                                                          #ty ruby docs!!
  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end



  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end
=end



