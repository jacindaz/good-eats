class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params["restaurant_id"])
  end

  # POST action to create a new review
  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params["restaurant_id"])
    @review.restaurant = @restaurant

    if @review.save
      redirect_to "/restaurants/#{@restaurant.id}"
    else
      flash[:notice] = "Your review couldn't be saved. Sorry!"
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :body, :restaurant_id)
  end
end
