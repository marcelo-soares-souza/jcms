class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.string :abstract
      t.text :body
      t.references :license

      t.timestamps
    end
    add_index :texts, :license_id
  end
end
