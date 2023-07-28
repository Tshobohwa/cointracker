class AddColumnNameToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :expenses_counter, :integer
  end
end
