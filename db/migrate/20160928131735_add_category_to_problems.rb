class AddCategoryToProblems < ActiveRecord::Migration[5.0]
  def change
    add_column :problems, :category, :string
  end
end
