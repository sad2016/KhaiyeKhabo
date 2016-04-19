class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
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
    @comment = Comment.new(recipe_id: @recipe.id, user_id: current_user.id) if user_signed_in?
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
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
      params.require(:recipe).permit(:title, :description, :ingredients, :directions, :preptime, :cooktime, :servings, :cuisine_id, :cookcategory_id, :user_id, :picture)
    end
end
