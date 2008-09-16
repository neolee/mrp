class ForumsController < ApplicationController
  # GET /forums
  # GET /forums.xml
  def index
    @category = Category.find(params[:category_id])
    @forums = @category.forums.find(:all, :order => "creation_date")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forums }
    end
  end

  # GET /forums/1
  # GET /forums/1.xml
  def show
    redirect_to forum_posts_path(Forum.find(params[:id]))
  end
end
