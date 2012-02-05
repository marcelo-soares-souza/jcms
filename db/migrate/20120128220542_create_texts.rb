class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.string :abstract
      t.string :slug
      t.text :body
      t.boolean :publish     , :default => false
      t.boolean :firstpage   , :default => false
      t.references :license

      t.timestamps
    end
    add_index :texts, :license_id
    add_index :texts, :slug, :unique => true
   end
end
