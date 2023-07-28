class Expense < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_and_belongs_to_many :categories
  before_save :update_categories_expenses_counter

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  def update_categories_expenses_counter
    categories.each do |category|
      expense_count = CategoriesExpense.where(category_id: category.id).count
      category.update(expenses_counter: expense_count)
    end
  end
end
