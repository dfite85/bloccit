require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:price) {RandomData.random_number }
  let(:topic) { Topic.create!(name: name, description: description, price: intiger) }
  let(:post) { topic.sponsored_posts.create!(title: title, body: body, price: intiger) }
  it { is_expected.to belong_to(:topic) }
  
   describe "attributes" do
      it "has title and body attributes" do
          expect(sponsored_posts).to have_attributes(title: title, body: body, price: intiger)
      end
  end
end
