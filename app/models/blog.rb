class Blog < ActiveRecord::Base
    has_many :comments
    belongs_to :user
    validates_uniqueness_of :title
    validates_presence_of :author_id, :title, :body
end