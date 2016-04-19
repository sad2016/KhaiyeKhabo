class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :ingredients
      t.text :directions
      t.string :preptime
      t.string :cooktime
      t.integer :servings
      t.references :cuisine, index: true, foreign_key: true
      t.references :cookcategory, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :picture

      t.timestamps null: false
    end
  end
end
