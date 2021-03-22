class RecipesController < ApplicationController
  # before_action :authorize, only: [:new, :edit, :destroy]

  def index
    if params[:search]
      @recipes = Recipe.search(params[:search])
    elsif params[:sort_rating]
      @recipes = Recipe.order("rating DESC")
    elsif params[:sort_alpha]
      @recipes = Recipe.order("title")
    else
      @recipes = Recipe.order("title")
    end
    render :index
  end

  def new
    @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe added!"
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredient = Ingredient.new
    render :show
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      if params[:recipe][:ingredient_ids]
        @ingredient = Ingredient.find(params[:recipe][:ingredient_ids])
        @recipe.ingredients << @ingredient
      elsif params[:recipe][:tag_ids]
        @tag = Tag.find(params[:recipe][:tag_ids])
        @recipe.tags << @tag
      end
      flash[:notice] = "Recipe updated!"
      redirect_to recipe_path
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "Recipe deleted!"
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :instructions, :rating)
    end
end