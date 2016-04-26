class AddAmountToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :amount, :decimal
  end
end
