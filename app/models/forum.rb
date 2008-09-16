class Forum < ActiveRecord::Base
  belongs_to :category
  
  has_many :forum_props
  
  has_many :posts
  has_many :messages
end
