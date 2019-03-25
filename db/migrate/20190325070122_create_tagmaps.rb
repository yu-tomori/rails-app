class CreateTagmaps < ActiveRecord::Migration[5.1]
  def change
    create_table :tagmaps do |t|
      t.integer :tag_id
      t.integer :article_id

      t.timestamps
    end
    add_index :tagmaps, :tag_id
    add_index :tagmaps, :article_id
    add_index :tagmaps, [:tag_id, :article_id], unique: true
  end
end
