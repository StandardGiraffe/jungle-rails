class ReviewsController < ApplicationController

  def create
    @review = Review.new(
      product_id: params[:product_id],
      user_id: session[:user_id],
      description: params[:review][:description],
      rating: params[:review][:rating]
      )
    if @review.save
      redirect_to product_path(params[:product_id])
    else
      redirect_to product_path(params[:product_id])
    end

  end

  private

  # def review_params
    # params.require(:review).permit(:review => [:description, :rating])
  # end

end
