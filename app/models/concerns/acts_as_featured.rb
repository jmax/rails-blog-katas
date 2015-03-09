module ActsAsFeatured
  extend ActiveSupport::Concern

  included do
    scope :featured,  -> (q) {
      where("featured_at NOT NULL").order("featured_at DESC").
        limit(q)
    }
  end

  def featured?
    featured_at.present?
  end

  def feature!
    update_attributes(featured_at: Time.now)
  end

  def unfeature!
    update_attributes(featured_at: nil)
  end
end
