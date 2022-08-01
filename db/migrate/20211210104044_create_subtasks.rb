# frozen_string_literal: true

class CreateSubtasks < ActiveRecord::Migration[6.1]
  def change
    create_table :subtasks do |t|
      t.string :title
      t.string :description
      t.date :date
      t.time :time
      t.string :tag
      t.boolean :completed
      t.belongs_to :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
