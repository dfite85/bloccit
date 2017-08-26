class SponsoredPostsController < ApplicationController
  def index
  end
  
  def show
     @sponsored_posts = SponsoredPost.find(params[:id])
  end

  def new
    @sponsored_posts = SponsoredPost.new
  end

  def edit
     @sponsored_posts = SponsoredPost.find(params[:id])
  end
end



#please tell me atleast this is right!!!