class HomeController < ApplicationController

    def index
        @user = current_user
        @recipes = Recipe.all
        @ingredients = Ingredient.all
    end

    def about
    end
    

end
