class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    @forum = Forum.find(params[:forum_id])
    @category = Category.find(@forum.category_id)
    @posts = @forum.posts.paginate :page => params[:page], :per_page => posts_per_page, :order => "creation_date"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    redirect_to post_messages_path(Post.find(params[:id]))
  end
end
