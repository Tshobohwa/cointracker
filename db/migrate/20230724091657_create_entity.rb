class CreateEntity < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.float :amount
      t.integer :author_id

      t.timestamps
    end
    add_foreign_key :entities, :users, column: :author_id
    add_index :entities, :author_id
  end
end
