require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:user) { User.create!(name: "User", email: "user@bloccit.com", password: "helloworld") }
  let(:comment) {Comment.create!(body: 'Comment Body', post: post, user: user) }                                          #creates a comment associated with the user
  
  it { is_expected.to belong_to(:post) }                                                                                  #test that comment belongs to a user and post
  it { is_expected.to belong_to(:user) }
  
  it { is_expected.to validate_presence_of(:body) }                                                                       #test that a comments body is present with atleast 5 characters
  it { is_expected.to validate_lenght_of(:body).is_at_least(5) }
  
  describe "attributes" do
      it "has a body attribute" do
          expect(comment).to have_attributes(body: "Comment Body")
      end
  end
end
