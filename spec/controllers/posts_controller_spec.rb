require 'rails_helper'
include SessionsHelper

RSpec.describe PostsController, type: :controller do
  
  let(:my_user) { User.create!(name: "User", email: "user@bloccit.com", password: "helloworld") }
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user) }

     context "guest user" do
 # #6
     describe "GET show" do
       it "returns http success" do
         get :show, topic_id: my_topic.id, id: my_post.id
         expect(response).to have_http_status(:success)
       end
 
       it "renders the #show view" do
         get :show, topic_id: my_topic.id, id: my_post.id
         expect(response).to render_template :show
       end
 
       it "assigns my_post to @post" do
         get :show, topic_id: my_topic.id, id: my_post.id
         expect(assigns(:post)).to eq(my_post)
       end
     end
 
 # #7
     describe "GET new" do
       it "returns http redirect" do
         get :new, topic_id: my_topic.id
 # #8
         expect(response).to redirect_to(new_session_path)
       end
     end
 
     describe "POST create" do
       it "returns http redirect" do
         post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
         expect(response).to redirect_to(new_session_path)
       end
     end
 
     describe "GET edit" do
       it "returns http redirect" do
         get :edit, topic_id: my_topic.id, id: my_post.id
         expect(response).to redirect_to(new_session_path)
       end
     end
 
     describe "PUT update" do
       it "returns http redirect" do
         new_title = RandomData.random_sentence
         new_body = RandomData.random_paragraph
 
         put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body}
         expect(response).to redirect_to(new_session_path)
       end
     end
 
     describe "DELETE destroy" do
       it "returns http redirect" do
         delete :destroy, topic_id: my_topic.id, id: my_post.id
         expect(response).to have_http_status(:redirect)
       end
     end
   end
   
  context "signed-in user" do
     before do
       create_session(my_user)
  end
  
  describe "GET new" do
    
    it "returns https success" do
      get :new, topic_id: my_topic.id                                           #when new is invoked a new and unsaved Post obj is created
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do                                               #verifies that the new renders the correct template
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new                                  #Questions for k-dog, why is there now () around : new here
    end
    
    it "instantiates @post" do                                                  #expect the @post inst var to be init by PostsContrller#new and assings gives us access to the @post var assiningin it to :post
      get :new, topic_id: my_topic.id
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe "Post create" do
    
      it "increases the number of Post by 1" do                                   #expect after PostsContorller#create is called wih parm the ocunt will increase by one
        expect{post :create, topic_id: my_topic.id, post: { title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
      end
    
      it "assigns the new post to @post" do                                       #when create is posted we expect post to be assinged to @post
        post :create, topic_id: my_topic.id, post: { title: RandomData.random_sentence, body: RandomData.random_paragraph }
        expect(assigns(:post)).to eq Post.last
      end
    

  end
  
  describe "GET show" do
    
      it "returns http success" do
        get :show, topic_id: my_topic, id: my_post.id
        expect(response).to have_http_status(:success)
      end
    
      it "renders the #show view" do
        get :show, topic_id: my_topic.id, id: my_post.id
        expect(response).to render_template :show
      end
    
      it "assigns my_post to @post" do
        get :show, topic_id: my_topic.id, id: my_post.id
        expect(assigns(:post)).to eq(my_post)
      end
  end
  
  describe "GET edit" do
    
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_post.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: my_post.id
      expect(response).to render_template :edit                                 #expect the edit view to render when a post is edited
    end
    
    it "assigns post to be updated to @post" do                                 #we test that edit assigns the correct post to be updated to @post
      get :edit, topic_id: my_topic.id, id: my_post.id
      post_instance = assigns(:post)
      expect(post_instance.id).to eq my_post.id
      expect(post_instance.title).to eq my_post.title
      expect(post_instance.body).to eq my_post.body
    end
  end
  
  describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      
      put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body}
      
      updated_post = assigns(:post)
      expect(updated_post.id).to eq my_post.id                                  #test that the @post was updated wit the title and body passed to update and that id was not changed
      expect(updated_post.title).to eq new_title
      expect(updated_post.body).to eq new_body                                  #new body
    end
    
    it "redirests to the updated post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body}
      expect(response).to redirect_to [my_topic,my_post]                                   #expected to be redirected to posts show after the update
    end
    
  end
  
  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, topic_id: my_topic.id, id: my_post.id
      count = Post.where({id: my_post.id}).size
      expect(count).to eq 0
    end
    
    it "redirects th topic show" do
      delete :destroy, topic_id: my_topic.id, id: my_post.id
      expect(response).to redirect_to my_topic
    end
    
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
=end



