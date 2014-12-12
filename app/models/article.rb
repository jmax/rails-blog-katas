class Article < ActiveRecord::Base

  validates :title, :body, presence: true

  scope :published, -> { where('published_at <= ?', Time.now) }

  scope :latest,    -> (q) { order('published_at DESC').limit(q) }

end
