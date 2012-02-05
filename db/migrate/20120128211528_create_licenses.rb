class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end
    add_index :licenses, :name,                :unique => true
  end
end
