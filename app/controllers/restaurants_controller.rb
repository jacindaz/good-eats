class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
    @title = "Create a New Restaurant"
  end

  # POST action to create a new restaurant
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to "/questions/#{@question.id}"
    else
      flash[:notice] = "Your question couldn't be saved. Sorry!"
      render :new
    end
  end

  def update
  end

end
