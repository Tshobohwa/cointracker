class CathegoryController < ApplicationController
  def index
    @cathegories = Cathegory.where({ author_id: current_user.id })
  end
end
