class RemoveTitleFromBreakEven < ActiveRecord::Migration[5.0]
  def change
    remove_column :break_evens, :title, :string
  end
end
