class Task < ApplicationRecord
    belongs_to :assignee
    belongs_to :assigner 
end
