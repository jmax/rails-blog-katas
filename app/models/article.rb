class Article < ActiveRecord::Base
  FEATURED_COUNT = 3

  include ActsAsFeatured

  has_many :comments

  validates :title, :body, presence: true

  scope :published, -> { where('published_at <= ?', Time.now) }

  scope :latest,    -> (q) { order('published_at DESC').limit(q) }
end
