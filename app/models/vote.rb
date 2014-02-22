class Vote < ActiveRecord::Base
  validates_presence_of :value
  validates_numericality_of :value,
    greater_than_or_equal_to: -1,
    less_than_or_equal_to: 1

  belongs_to :user
  belongs_to :votable, polymorphic: true
end
