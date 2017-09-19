class CommentsController < ApplicationController
    
    before_action :require_sign_in                                              #used to ensure guest users cant create comments
    before_action :authorize_user, only: [:destroy]                             #add authorize user to ensure non permitted ppl cant delete
    
    def create
        @post = Post.find(params[:post_id])                                     #finds correct post then creates new comment using comment params and assigns the comment to the current user
        comment = @post.comments.new(comment_params)
        comment.user = current_user
        
        if comment.save
            flash[:notice] = "Your shit was saved bro."                         #sucessful save
            
            redirect_to [@post.topic, @post]
        else
            flash[:alert] = "Somewhere a ball got dropped.. proably on your end, try again."      #not so successful save
            
            redirect_to [@post.topic, @post]
        end
    end
    
   def destroy
     @post = Post.find(params[:post_id])
     comment = @post.comments.find(params[:id])
 
     if comment.destroy
       flash[:notice] = "Comment was deleted."
       redirect_to [@post.topic, @post]
     else
       flash[:alert] = "Comment couldn't be deleted. Try again."
       redirect_to [@post.topic, @post]
     end
   end
    
    private
    
    def comment_params                                                          #defines a private comment params that white list the params needed to create a comment
        params.require(:comment).permit(:body)
    end
    
    def authorize_user
     comment = Comment.find(params[:id])
     unless current_user == comment.user || current_user.admin?
       flash[:alert] = "You do not have permission to delete a comment."
       redirect_to [comment.post.topic, comment.post]
     end
    end
end
