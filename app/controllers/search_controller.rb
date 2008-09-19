class SearchController < ApplicationController
  def index
    @categories = Category.find(:all)
  end
  
  def result
    subject = params[:subject]
    user_name = params[:user_name]
    forum_id = params[:forum_id]
    start_date = Time.mktime(params[:start_date][:year], params[:start_date][:month], params[:start_date][:day])
    end_date = Time.mktime(params[:end_date][:year], params[:end_date][:month], params[:end_date][:day])
    full_text = params[:full_text]
    
    if full_text and not full_text.empty?
      messages = Message.find_with_ferret(full_text, :limit => :all).collect { |m| m.post_id }.uniq
    else
      cond = []
      if subject and not subject.empty?
        cond << "subject regexp :subject"   # MySQL only
      end
    
      if user_name and not user_name.empty?
        user = User.find(:all, :conditions => ["user_name = ?", user_name], :order => "id").first
        params[:user_id] = user.id
        cond << "user_id = :user_id"
      end

      if forum_id and not forum_id.empty? and forum_id.to_i > 0
        params[:forum_id] = forum_id.to_i
        cond << "forum_id = :forum_id"
      end
    
      if end_date and end_date < Time.now
        params[:start_date] = make_db_time(start_date)
        params[:end_date] = make_db_time(end_date)
        cond << "creation_date between :start_date and :end_date"
      end

      messages = Message.find(:all, :select => "distinct post_id", 
        :conditions => [cond.join(" and "), params]).collect { |m| m.post_id }
    end
    
    @results = Post.find(:all, :conditions => ["id in (?)", messages], :order => "creation_date"
      ).paginate :page => params[:page], :per_page => posts_per_page
  end

end
