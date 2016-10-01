class AddDescriptionToProblems < ActiveRecord::Migration[5.0]
  def change
    add_column :problems, :description, :string
  end
end
