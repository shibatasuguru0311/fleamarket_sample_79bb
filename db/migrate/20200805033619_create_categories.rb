class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :ancestry
      t.timestamps
    end
    add_index :categories, :name
    add_index :categories, :ancestry
  end
end
