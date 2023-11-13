class RecipesController < ApplicationController

  # GET /recipes or /recipes.json
  def index
    @user = User.find(params[:user_id])
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @user = User.find(params[:user_id])
    @recipe = Recipes.find(params[:id])
    @recipe.destroy!

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


  # Only allow a list of trusted parameters through.
  def recipe_params
    params.fetch(:recipe, {})
  end
end
