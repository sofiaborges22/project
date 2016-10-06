class ChangeSellingPriceInBreakEvens < ActiveRecord::Migration[5.0]
  def change
  	change_column :break_evens, :selling_price, :float
  end
end
