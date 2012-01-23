class Inspiration < ActiveRecord::Base
  attr_accessible :body, :author
  
  belongs_to :user
  
  validates :body, :presence => true, :length => { :maximum => 300 }
  validates :user_id, :presence => true

end
