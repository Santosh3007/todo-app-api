# frozen_string_literal: true

class RemoveDateFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :date, :date
  end
end
