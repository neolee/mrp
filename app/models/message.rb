class Message < ActiveRecord::Base
  belongs_to :forum
  belongs_to :post
end
