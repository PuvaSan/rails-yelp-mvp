class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show create]

  def index
    @restaurants = Restaurant.all
  end

  # only using before_action: set_restaurant
  def show

    @review = Review.new(params[:review])
    @review.restaurant = @restaurant
    @review.save

    render :new, status: :unprocessable_entity if @review.save

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    # redirect_to @restaurant, notice: "#{@restaurant.name} was successfully created"

    if @restaurant.save
      redirect_to @restaurant, notice: "#{@restaurant.name} was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.required(:restaurant).permit(:name, :address, :category)
  end

  def review_params
    params.required(:review).permit(:rating, :content)
  end
end
