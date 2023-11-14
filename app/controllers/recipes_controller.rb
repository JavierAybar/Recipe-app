class RecipesController < ApplicationController
  def public
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  # GET /recipes or /recipes.json
  def index
    @user = User.find(params[:user_id])
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
    @foods = @user.foods
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      flash[:success] = 'Recipe Added!'
      redirect_to user_recipes_path(@recipe.user)
    else
      render :new
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    @recipe.recipe_foods.destroy_all
    
    if @recipe.destroy
      flash[:success] = 'Recipe Deleted!'
      redirect_to user_recipes_path(@user)
    else
      flash[:error] = 'Something went wrong!'
    end
  end

  def toggle_public
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
    @recipe.update(public: !@recipe.public)

    redirect_to user_recipe_path(@user, @recipe)
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
