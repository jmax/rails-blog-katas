class Article < ActiveRecord::Base
  FEATURED_COUNT = 3

  include ActsAsFeatured

  has_many :comments

  validates :title, :body, presence: true

  validate :published_this_year

  scope :published, -> { where('published_at <= ?', Time.now) }

  scope :latest,    -> (q) { order('published_at DESC').limit(q) }

protected

  def published_this_year
    if published_at && published_at.year > Time.now.year
      errors.add(:published_at, "must be published this year")
    end
  end

end
