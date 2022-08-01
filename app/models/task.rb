# frozen_string_literal: true

class Task < ApplicationRecord
  has_many :subtasks
  belongs_to :user
end
