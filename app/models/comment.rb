class Comment < ActiveRecord::Base
  belongs_to :article

  validates :article, :author, :body, presence: true

  scope :most_recent, -> { order("created_at DESC") }
end
