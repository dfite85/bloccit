class FavoriteMailer < ActionMailer::Base
    default from: "dfite85@gmail.com"
    
  def new_comment(user, post, comment)
 
     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
  end
  
  def new_post(post)
      
     headers["Message-ID"] = "<posts/#{post.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"
     
     @post = post
     
     mail(to: post.user.email, subject: "You're now stalking, #{post.title}!")
  end
     
      
end
