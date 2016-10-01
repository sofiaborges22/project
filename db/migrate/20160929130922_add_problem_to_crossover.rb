class AddProblemToCrossover < ActiveRecord::Migration[5.0]
  def change
    add_reference :crossovers, :problem, foreign_key: true
  end
end
