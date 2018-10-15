class ReviewsController < ApplicationController

  # before_action :require_login

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

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(params[:product_id])
  end


  private

  # def review_params
    # params.require(:review).permit(:review => [:description, :rating])
  # end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to product_path(params[:product_id])
    end
  end

end

