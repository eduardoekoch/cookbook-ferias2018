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
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      @msg = 'Você deve informar todos os dados da receita'
      render 'new'   
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update recipe_params
      flash[:notice] = 'Alteração realizada com Sucesso'
      redirect_to @recipe
    else 
      flash[:alert] = 'Campos obrigatórios não preenchidos'
      render 'edit'
    end
  end
  
  def search
    if params[:q].to_s.blank?
      @recipes = Recipe.all
      flash[:alert] = 'Por favor, digite algum filtro de pesquisa.'
    else
      flash[:alert] = "Resultado da busca por: #{params[:q]}"
      @recipes = Recipe.where({title: params[:q]})
    end
  end
  
  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :recipe_type, :cuisine_id, :difficulty, :cook_time, :ingredients, :cook_method, :photo)
  end
end
