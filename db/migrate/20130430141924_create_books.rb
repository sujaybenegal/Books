class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors
      t.string :image_link
      t.text :description
      
      t.timestamps
    end
  end
end
