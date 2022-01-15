class AddUseridtoTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :user, foreign_key: true, on_delete: :cascade
  end
end
