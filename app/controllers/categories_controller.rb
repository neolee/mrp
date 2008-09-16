class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.find(:all, :conditions => ["id>1"], :order => "creation_date")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    redirect_to category_forums_path(Category.find(params[:id]))
  end
end
