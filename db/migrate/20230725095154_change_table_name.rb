class ChangeTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :entities, :expenses
  end
end
