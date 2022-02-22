class UsersController < ApplicationController
    def show

    end

    def index
        @recipes = Recipe.all
        @ingredients = Ingredient.all
        @user = current_user

    end

    def edit

    end
    
end
