class User < ApplicationRecord
    has_secure_password 
    validates :username, presence: true
    validates :username, uniqueness: true
    
    has_many :task_assignees, foreign_key: :assigner_id, class_name: "User"
	has_many :assignees, through: :task_assignees
    
    has_many :task_assigners, foreign_key: :assignee_id, class_name: "User"
    has_many :assigners, through: :task_assigners

end
