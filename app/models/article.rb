class Article < ActiveRecord::Base

  validates :title, :body, presence: true

  scope :published, -> { where('published_at <= ?', Time.now) }

end
