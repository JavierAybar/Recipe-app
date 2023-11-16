class FoodsController < ApplicationController
  # GET /foods or /foods.json
  def index
    @user = User.find(params[:user_id])
    @foods = @user.foods
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      flash[:success] = 'Food Added!'
      redirect_to user_foods_path(@food.user)
    else
      render :new
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food = Food.find(params[:id])
    @user = @food.user
    if @food.destroy
      flash[:success] = 'Food Deleted!'
      redirect_to user_foods_path(@user)
    else
      flash[:error] = 'Something went wrong!'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
