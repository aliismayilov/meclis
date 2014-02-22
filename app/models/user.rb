class User < ActiveRecord::Base
  attr_accessor :recently_created

  validates :email, presence: true, uniqueness: true
  validates :uid, presence: true, uniqueness: true
  validates :access_token, presence: true, uniqueness: true

  after_create do
    self.recently_created = true
  end

  def recently_created?
    @recently_created
  end

  def self.find_or_create_with_omniauth(auth)
    user = self.find_or_create_by provider: auth["provider"], uid: auth["uid"]

    user.assign_attributes({
      name:             auth["info"]["name"],
      email:            auth["info"]["email"],
      avatar_photo_url: auth["info"]["image"],
      access_token:     auth["credentials"]["token"],
    })

    user.save!

    user
  end
end
