class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
    # puts @review
  end

  def create
    # @review = Product.reviews.create(review_params)
  end

  private

  def review_params
    # params.permit(:description, :rating)
  end

end
