require 'rails_helper'

RSpec.describe Post, type: :model do
  
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }             #creates an new instance of the post class and names it post
  
  describe "attributes" do
      it "has title and body attributes" do
          expect(post).to have_attributes(title: "New Post Title", body: "New Post Body") #expects Post class to have attributes in the title and body
      end
  end
  
end
