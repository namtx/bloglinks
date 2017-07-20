class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.datetime :published_at
      t.string :title
      t.string :url
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
