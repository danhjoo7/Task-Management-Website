class Task < ApplicationRecord
    belongs_to :assignee, foreign_key: "assignee_id", class_name: "User"
    belongs_to :assigner, foreign_key: "assigner_id", class_name: "User" 
    has_many :tasks
end
