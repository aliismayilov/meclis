class Comment < ActiveRecord::Base
  validates :content, presence: true

  has_many :votes, as: :votable, dependent: :destroy

  belongs_to :user
  belongs_to :post
end
