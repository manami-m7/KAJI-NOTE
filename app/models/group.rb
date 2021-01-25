class Group < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :users
end
