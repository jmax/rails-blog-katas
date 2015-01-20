class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :article, index: true

      t.string :author
      t.text   :body

      t.timestamps
    end
  end
end
