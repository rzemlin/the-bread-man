class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
  before_action :set_user
  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
    @user = current_user
    
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
  end

  # GET /recipes/new
  def new
    @user = current_user
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    set_recipe
    @user = @recipe.user_id
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.save
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    recipe = Recipe.find_by_id(params[:id])
    recipe.update(recipe_params)
    recipe.save
    redirect_to user_path
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :recipe_ingredient, :user_id)
    end

    def set_user
      @user = current_user
    end
end
