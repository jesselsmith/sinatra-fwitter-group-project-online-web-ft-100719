class Tweet < ActiveRecord::Base
  extend Concerns::Slugifiable
  belongs_to :user

  def slug
    self.id
  end

  def self.find_by_slug(slug)
    self.all.find { |tweet| tweet.slug == slug}
  end
end
