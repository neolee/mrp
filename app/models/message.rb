class Message < ActiveRecord::Base
  belongs_to :forum
  belongs_to :post
  
  acts_as_ferret(:fields => { :subject => {}, :body => {} }, :ferret => { 
    :analyzer => RMMSeg::Ferret::Analyzer.new { |tokenizer| Ferret::Analysis::LowerCaseFilter.new(tokenizer) } })
end
