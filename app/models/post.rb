class Post < ActiveRecord::Base
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  belongs_to :user
end
