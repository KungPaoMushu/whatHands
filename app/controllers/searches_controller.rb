class SearchesController < ApplicationController

  def new
    @search = Search.new
    @cuisine_types = Recipe.uniq.pluck(:cuisine_type)
    @meal_types = "Breakfast", "Lunch" , "Dinner", "Snack"
    @ingredients = Recipe.uniq.pluck(:ingredients_attributes)
  end
  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
  
    @search = Search.find(params[:id])
   
  end

private

  def search_params
    params.require(:search).permit(:keywords, :ingredients, :meal_type, :cuisine_type)
  end

end
