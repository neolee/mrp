class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.xml
  def index
    @post = Post.find(params[:post_id])
    @forum = Forum.find(@post.forum_id)
    @category = Category.find(@forum.category_id)
    @messages = @post.messages.find(:all, :order => "creation_date")
    @root_message = @messages.first

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

end
