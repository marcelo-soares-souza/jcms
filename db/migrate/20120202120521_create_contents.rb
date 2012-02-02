class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :user
      t.references :text
      t.references :image
      t.boolean :submittedby

      t.timestamps
    end
    add_index :contents, :user_id
    add_index :contents, :text_id
    add_index :contents, :image_id
  end
end
