class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    redirect_to recipe_path(@recipe.id)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :cuisine, :recipe_type)
  end
end
