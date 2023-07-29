class ExpensesController < ApplicationController
  def index
    @category = Category.includes(:expenses).find(params[:category_id])
    @expenses = @category.expenses.order(created_at: :desc)
  end
end
