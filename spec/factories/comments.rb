 FactoryGirl.define do
   factory :comments do
     user
     post RandomData.random_sentence
     body RandomData.random_paragraph
   end
 end