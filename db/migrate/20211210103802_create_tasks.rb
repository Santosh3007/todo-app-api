# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :date
      t.time :time
      t.string :tag

      t.timestamps
    end
  end
end
