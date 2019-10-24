class Task < ApplicationRecord

    belongs_to :assignee, foreign_key: "assignee_id", class_name: "User"
    belongs_to :assigner, foreign_key: "assigner_id", class_name: "User" 
    has_many :comments
     
    validates :assignee_id, :title, :content, presence: true
    validates :title, uniqueness: true
    
    
    def self.show_user_assigned_tasks(user)
        Task.all.select {|task| task.assignee_id == user.id}
    end

    private

end
