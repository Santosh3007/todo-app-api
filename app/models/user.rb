# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tasks
  has_many :subtasks, through: :tasks
  has_secure_password
end
