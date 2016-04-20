class IngredientRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  attr_accessor :amount
  attr_accessor :measurement_unit #-> need a setter/getter

end
