class Post < ActiveRecord::Base
  belongs_to :forum
  
  has_many :post_props
  
  has_many :messages
end
