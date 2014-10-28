class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phones, array: true, default: []
      t.string :urls, array: true, default: []
      t.text :address
      t.integer :category_id
      t.timestamps
    end

    add_index :contacts, :category_id
  end
end
