class Message < ActiveRecord::Base
  belongs_to :forum
  belongs_to :post
  
  acts_as_ferret
end
