class ShoppingListsController < ApplicationController

    def index
      @user = current_user
      @total_foods = 0
      @total_price = 0
      @recipe_foods = []
  
      @user.recipes.includes(recipe_foods: :food).each do |recipe|
        recipe.recipe_foods.each do |recipe_food|
          quantity = recipe_food.quantity
          price = recipe_food.food.price * quantity
  
          @total_foods += 1
          @total_price += price
  
          @recipe_foods << { food: recipe_food.food, quantity:, price: }
        end
      end
    end
  
end
