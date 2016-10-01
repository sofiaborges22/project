class CreateDecisions < ActiveRecord::Migration[5.0]
  def change
    create_table :decisions do |t|
      t.string :title
      t.integer :associated_cost
      t.integer :favorable_probability
      t.integer :unfavorable_probability
      t.integer :favorable_result
      t.integer :unfavorable_result

      t.timestamps
    end
  end
end
