class CreateCrossovers < ActiveRecord::Migration[5.0]
  def change
    create_table :crossovers do |t|
      t.string :title
      t.integer :units
      t.integer :fixed_cost
      t.float :variable_cost

      t.timestamps
    end
  end
end
