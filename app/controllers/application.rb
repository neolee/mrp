# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '10931fd7df569c8055532ebaa77d3b74'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  # Make the 15-char time string from a standard Time instance
  def make_db_time(t)
    (t.to_f * 1000).to_i.to_s.rjust(15, "0")
  end
  
  # Default posts/page value
  def posts_per_page
    30
  end
  
end
