class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all.sort_by { |ingredient| ingredient[:name] }
    render :index
  end

  def new
    @ingredient = Ingredient.new
    render :new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new(ingredient_params)
    if @ingredient.save
      @ingredient.recipes << @recipe
      flash[:notice] = "Ingredient added!"
      redirect_to recipe_path(@recipe)
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    render :edit
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    render :show
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      flash[:notice] = "Ingredient updated!"
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    flash[:notice] = "Ingredient deleted!"
    redirect_to ingredients_path
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end