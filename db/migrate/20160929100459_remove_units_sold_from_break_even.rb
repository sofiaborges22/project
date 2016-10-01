class RemoveUnitsSoldFromBreakEven < ActiveRecord::Migration[5.0]
  def change
    remove_column :break_evens, :units_sold, :integer
  end
end
