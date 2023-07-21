class Blog < ActiveRecord::Base
    has_many :comments
    has_many :favorites
    belongs_to :author, class_name: 'User'
    validates_uniqueness_of :title
    validates_presence_of :author_id, :title, :body
end