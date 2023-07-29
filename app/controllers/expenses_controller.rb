class ExpensesController < ApplicationController
  def index
    id = params[:category_id]
    @category = Category.includes(:expenses).find(id)
  end

  def new
    @expense = Expense.new
    @group = Category.new
    @categories = current_user.categories.all
  end

  def create
    name = expense_param[:name]
    amount = expense_param[:amount]
    Category.find_by(name: expense_param[:category_name])
    @expense = Expense.new(name:, amount:, author_id: current_user.id)

    if @expense.save
      @categories_expenses = CategoriesExpense.new(category_id: params[:category_id], expense_id: @expense.id)
      if @categories_expenses.save
        redirect_to category_expenses_path, notice: 'Expense was successfully created.'
      else
        render :new
      end
    else
      render :new
    end
  end

  private

  def expense_param
    params.require(:expense).permit(:name, :amount)
  end
end
