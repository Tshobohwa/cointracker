class Expense < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'

  has_many :categories_expenses, dependent: :destroy
  has_many :categories, through: :categories_expenses, dependent: :destroy


  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
