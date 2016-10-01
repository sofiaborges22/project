class ChangeIntegerInBreakEvens < ActiveRecord::Migration[5.0]
  def change
  	change_column :break_evens, :variable_cost, :float
  end
end
