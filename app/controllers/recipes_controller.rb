class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  after_action :set_ingredients, only: [:create, :update]
  load_and_authorize_resource

  skip_authorize_resource :show => :show
  skip_authorize_resource :search => :search
  skip_authorize_resource :searchcuisine => :searchcuisine
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = (!params[:recipe].blank?)? Recipe.where("id in (" + params[:recipe] + ")") : Recipe.all
    @recipes_json = Recipe.where("title ilike ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: custom_json_for(@recipes_json)}
    end
  end


  # GET /recipes/1
  # GET /recipes/1.json
  def show
    puts "sanjanaaaaaaaa"

    @ingredientArray=Array.new
    @amountArray=Array.new
    @unitArray=Array.new
    @comment = Comment.new(recipe_id: @recipe.id, user_id: current_user.id) if user_signed_in?
    @ingredientrecipe = IngredientRecipe.all.select("ingredient_id").where("recipe_id = #{@recipe.id}")
    @ingredientrecipe.each do |ind|
      @ingredientArray.push(ind.ingredient_id)
      @amountArray.push(ind.amount.to_s)
      puts ind.ingredient_id
      puts ind.amount
      puts ind.measurement_unit

      @unitArray.push(ind.measurement_unit)
    end
    puts "heyyyyyyyyyyyyy"
    puts @amountArray
    
    @ingredients = Ingredient.all.where("id in (:ingredArray)", ingredArray: @ingredientArray)
    @ingredients.each do |ind|
      puts ind.name
    end
  end



  # GET /recipes/new
  def new
    @recipe = Recipe.new
   # @recipe.save

   @ingredient = Ingredient.new
 #   @ingredient.save
  # @recipe.ingredients.create(Ingredient.new(name: "STH"))
  end


  # GET /recipes/1/edit
  def edit
  end
  def search
    @recipesearch = Recipe.where("title ilike ?", "%#{params[:search]}%")
  end
  # GET /recipes/view
  def myrecipe
    @recipes = Recipe.all
    @myrecipes = Recipe.all.where(user_id: current_user.id)
  end

  def searchcuisine
    @recipes = Recipe.all
    @searchcuisines = (!params[:search].blank?)? Recipe.all.where(cuisine_id: params[:searchcuisine]).where("title ilike ?", "%#{params[:search]}%") : Recipe.all.where(cuisine_id: params[:searchcuisine])
    @cuisine = Cuisine.find(params[:searchcuisine]).name
    @cuisineid= Cuisine.find(params[:searchcuisine]).id
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id=current_user.id
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    def set_ingredients
      count = 0
      if params[:ingredient]
        params[:ingredient].each do |ingredient|
          @ingredient = Ingredient.create(name: ingredient, amount:params[:amount][count], measurement_unit:params[:unit][count])
          puts "heyyaa"
          puts params[:amount][count]
          puts params[:unit][count]
          @ingredient_recipe = IngredientRecipe.create(ingredient_id:@ingredient.id, recipe_id:@recipe.id, amount:params[:amount][count], measurement_unit:params[:unit][count])
          count=count+1
        end
      end


    end
    def custom_json_for(value)
      list = value.map do |recipe| {
          :id => recipe.id.to_s,
          :name => recipe.title.to_s
      }
      end
      list.to_json
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:ingredient_id,:title, :description, :ingredients, :directions, :preptime, :cooktime, :servings, :cuisine_id, :cookcategory_id, :user_id, :picture, ingredient_recipes_attributes: [:id,:amount, :measurement_unit])
    end
end
