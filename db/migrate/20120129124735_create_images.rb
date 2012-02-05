class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :abstract
      t.string :slug
      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size
      t.references :license
      t.boolean :publish     , :default => false
      t.boolean :firstpage   , :default => false

      t.timestamps
    end
    add_index :images, :license_id
    add_index :images, :slug, :unique => true
  end
end
