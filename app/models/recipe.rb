class Recipe < ActiveRecord::Base
  belongs_to :cuisine
  belongs_to :cookcategory
  belongs_to :user
  has_many :ingredients, :through => :ingredient_recipes
  has_many :ingredient_recipes, dependent: :destroy

  has_many :comments, dependent: :destroy
  #accepts_nested_attributes_for :ingredient_recipes
  ratyrate_rateable 'recipe'
  mount_uploader :picture, RecipeUploader
end
