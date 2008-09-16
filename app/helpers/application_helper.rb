# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def format_datetime
    "%m/%d/%Y %H:%M:%S"
  end
  
  def script_jquery
    "jquery.js"
  end
  
  def stylesheet_form
    "_library/cmxform/screen"
  end
  
  def stylesheet_paginator
    "_library/pagination"
  end
  
  def stylesheet_list
    "_library/table_gradient"
  end
  
  def stylesheet_message_flat
    "_library/table_hor-zebra"
  end

  def stylesheet_message_threaded
    "_library/"
  end
  
end
