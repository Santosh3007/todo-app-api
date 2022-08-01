# frozen_string_literal: true

class RemoveTimeFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :time, :time
  end
end
