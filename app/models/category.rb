class Category < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :categories_expenses, dependent: :destroy
  has_many :expenses, through: :categories_expenses, dependent: :destroy

  validates :name, :icon, presence: true
end
