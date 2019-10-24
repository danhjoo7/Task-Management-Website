class Comment < ApplicationRecord
    belongs_to :task

    validates :content, length: {maximum: 140} 
end
