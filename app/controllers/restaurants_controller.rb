class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.limit(10)
    @title = "All Restaurants"
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @title = "About #{@restaurant.name}"

    @reviews = []
    Review.all.each do |review|
      if review.restaurant_id.to_s == params[:id]
        @reviews << review
      end
    end


  end

  def new
    @restaurant = Restaurant.new
    @title = "Create a New Restaurant"
  end

  # POST action to create a new restaurant
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to "/restaurants/#{@restaurant.id}"
    else
      flash[:notice] = "Your restaurant couldn't be saved. Sorry!"
      render :new
    end
  end

  def update
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode, :description, :category)
  end

end
