class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :blog
    validates_presence_of :body
    
end
