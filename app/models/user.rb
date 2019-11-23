class User < ActiveRecord::Base
  extend Concerns::Slugifiable
  has_secure_password
  has_many :tweets

  def slug
    self.class.slugify(self.username)
  end

  def self.find_by_slug(slug)
    User.all.find { |user| user.slug == slug }
  end
end
