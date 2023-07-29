class CategoryController < ApplicationController
  def index
    @categories = Category.includes(:expenses).where({ user_id: current_user.id })
  end

  def new
    @category = Category.new
  end

  def create
    icon = category_param[:icon]
    name = category_param[:name]
    @category = Category.new(name:, icon:, user_id: current_user.id)

    if @category.save
      redirect_to category_index_path, notice: 'Category added successfully'
    else
      flash.now[:error] = @category.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def category_param
    params.require(:category).permit(:name, :icon)
  end
end
