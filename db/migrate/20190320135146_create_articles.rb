class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :url
      t.string :description
      t.string :image
      t.string :catchcopy
      t.integer :user_id

      t.timestamps
    end
  end
end
