class CookcategoriesController < ApplicationController
  before_action :set_cookcategory, only: [:show, :edit, :update, :destroy]
 load_and_authorize_resource
  # GET /cookcategories
  # GET /cookcategories.json
  def index
    @cookcategories = Cookcategory.all
  end

  # GET /cookcategories/1
  # GET /cookcategories/1.json
  def show
  end

  # GET /cookcategories/new
  def new
    @cookcategory = Cookcategory.new
  end

  # GET /cookcategories/1/edit
  def edit
  end

  # POST /cookcategories
  # POST /cookcategories.json
  def create
    @cookcategory = Cookcategory.new(cookcategory_params)

    respond_to do |format|
      if @cookcategory.save
        format.html { redirect_to @cookcategory, notice: 'Cookcategory was successfully created.' }
        format.json { render :show, status: :created, location: @cookcategory }
      else
        format.html { render :new }
        format.json { render json: @cookcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cookcategories/1
  # PATCH/PUT /cookcategories/1.json
  def update
    respond_to do |format|
      if @cookcategory.update(cookcategory_params)
        format.html { redirect_to @cookcategory, notice: 'Cookcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @cookcategory }
      else
        format.html { render :edit }
        format.json { render json: @cookcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cookcategories/1
  # DELETE /cookcategories/1.json
  def destroy
    @cookcategory.destroy
    respond_to do |format|
      format.html { redirect_to cookcategories_url, notice: 'Cookcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cookcategory
      @cookcategory = Cookcategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cookcategory_params
      params.require(:cookcategory).permit(:name)
    end
end
