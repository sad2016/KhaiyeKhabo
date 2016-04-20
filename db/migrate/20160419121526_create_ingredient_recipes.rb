class CreateIngredientRecipes < ActiveRecord::Migration
  def change
    create_table :ingredient_recipes do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.decimal :amount
      t.string :measurement_unit

      t.timestamps null: false
    end
  end
end
