class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :task_histories, dependent: :destroy
  belongs_to :group
  # accepts_nested_attributes_for
  accepts_nested_attributes_for :group
end
