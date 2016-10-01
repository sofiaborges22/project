class AddProblemIdToDecisions < ActiveRecord::Migration[5.0]
  def change
    add_reference :decisions, :problem, foreign_key: true
  end
end
