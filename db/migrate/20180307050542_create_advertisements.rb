class CreateAdvertisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.text :copy
      t.integer :price.to_int

      t.timestamps
    end
  end
end
