# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

5.times do
    User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
    )
end
users = User.all

#create Posts
15.times do
   Topic.create!(
        name:           RandomData.random_sentence,
        description:    RandomData.random_paragraph
        )
    end

50.times do                                                                     #this will run the block the specified number of times

  Post.create!(                                                                 #use create with a ! instructs the method to raise an error if there is a problem with the data seeded
      user: users.sample,
      topic_id:  Topic.last.id,
      title:  RandomData.random_sentence,                                       #using a method that does not exist yet is known as WISHFUL CODING, will create random string for title and body
      body:   RandomData.random_paragraph
   )
end

posts = Post.all

#create Comments

20.times do
    Comment.create!(
        post:  posts.sample,                                                    #sample retruns a random element from the array every time its called
        body:  RandomData.random_paragraph                                      #the comma used in these blocks are to seperate lines of code
    )
end

user = User.first
user.update_attributes!(
    email: 'dfite85@gmail.com',
    password: 'helloworld',
    )

puts "#{Post.count}"
Post.find_or_create_by(title: "Random ass title", body: "Random ass body")
puts "{Post.count}"

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
puts "#{SponsoredPost.count} Sponsored Posts created"


10.times do
    Advertisement.create!(                                                                 #use create with a ! instructs the method to raise an error if there is a problem with the data seede
      title:  RandomData.random_sentence,                                       #using a method that does not exist yet is known as WISHFUL CODING, will create random string for title and body
      copy:   RandomData.random_paragraph,
      price:  RandomData.random_number
   )
end


10.times do 
    Question.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: false
        )
    end
    
3.times do
    SponsoredPost.create!(
        title:  RandomData.random_sentence,
        body:   RandomData.random_paragraph,
        price:  RandomData.random_number
        )
    end
    
    

    
