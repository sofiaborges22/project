class ChangeIntegerInCrossovers < ActiveRecord::Migration[5.0]
  def change
  	change_column :crossovers, :variable_cost, :float
  end
end
