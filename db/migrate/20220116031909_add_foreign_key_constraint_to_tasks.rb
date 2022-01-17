class AddForeignKeyConstraintToTasks < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :tasks, :users
    add_foreign_key :tasks, :users, on_delete: :cascade
  end
end
