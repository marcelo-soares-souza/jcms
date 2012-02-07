class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.references :user
      t.references :text
      t.references :image
      t.boolean :submittedby , :default => true

      t.timestamps
    end
    add_index :owners, :user_id
    add_index :owners, :text_id
    add_index :owners, :image_id
  end
end
