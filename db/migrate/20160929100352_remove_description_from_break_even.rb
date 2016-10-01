class RemoveDescriptionFromBreakEven < ActiveRecord::Migration[5.0]
  def change
    remove_column :break_evens, :description, :string
  end
end
