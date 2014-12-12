class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string   :title
      t.text     :body
      t.datetime :published_at
      t.integer  :views_count

      t.timestamps
    end

    add_index :articles, :published_at
  end
end
