class AddMeasurementUnitToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :measurement_unit, :string
  end
end
