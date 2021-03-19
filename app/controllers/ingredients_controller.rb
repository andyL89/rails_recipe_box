class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order("name")
    @ingredient = Ingredient.new
    render :index
  end

  def create
    @ingredients = Ingredient.all
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:notice] = "Ingredient added!"
      redirect_to ingredients_path
    else
      render :index
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