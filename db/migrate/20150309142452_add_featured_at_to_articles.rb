class AddFeaturedAtToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :featured_at, :datetime
    add_index  :articles, :featured_at
  end
end
