class Problem < ApplicationRecord
	belongs_to :user
	has_many :decisions
	has_many :break_evens
	has_many :crossovers
end
