class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with :name => ENV['ADMIN_USERNAME'], :password => ENV['ADMIN_PASSWORD']

  def index
    @categories = Category.order(:name).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    redirect_to [:admin, :categories], notice: "New category created!"

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
