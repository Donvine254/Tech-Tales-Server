class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :blog
    validates_presence_of :body
    def created_at_date
        created_at.strftime("%b %d, %Y") 
      end
end
