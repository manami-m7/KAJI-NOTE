class Task < ApplicationRecord
  # belongs_to :group
  has_many :task_histories, dependent: :destroy
end
