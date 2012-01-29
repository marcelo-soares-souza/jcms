class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :abstract
      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size
      t.boolean :publish
      t.boolean :firstpage
      t.references :license

      t.timestamps
    end
    add_index :images, :license_id
  end
end
