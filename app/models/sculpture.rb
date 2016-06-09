class Sculpture < ActiveRecord::Base
  has_many :reviews, :class_name => "Review", :foreign_key =>"sculpture_id"
  has_many :fans, :through => :reviews, :source => :user
end
