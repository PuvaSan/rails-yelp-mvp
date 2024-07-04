class ReviewsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review was successfully made'
    else
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.required(:review).permit(:rating, :content)
  end

end
