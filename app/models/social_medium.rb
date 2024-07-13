class SocialMedium < ApplicationRecord
    belongs_to :user
    validates_presence_of :user_id, :platform, :url
    validates_uniqueness_of :platform, scope: :user_id
    validates_uniqueness_of :url, scope: :platform
end
