class RecipeFoodsController < ApplicationController
  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe = @recipe

    if @recipe_food.save
      flash[:success] = 'Ingredient Added!'
      redirect_to user_recipe_path(@recipe.user, @recipe)
    else
      flash[:error] = 'Something went wrong!'
      render :new
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = @recipe_food.recipe

    if @recipe_food.destroy
      flash[:success] = 'Ingredient Deleted!'
      redirect_to user_recipe_path(@recipe.user, @recipe)
    else
      flash[:error] = 'Something went wrong!'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
