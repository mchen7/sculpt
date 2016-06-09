class Review < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :sculpture_id, :presence => true
  validates :rating, :presence => true, :numericality => {:only_integer => true, :greater_than_or_equal_to =>1,
  :less_than_or_equal_to => 5}
  
  belongs_to :sculpture
  belongs_to :user
end
