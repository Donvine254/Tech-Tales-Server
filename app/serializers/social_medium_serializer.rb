class SocialMediumSerializer < ActiveModel::Serializer
  attributes :id, :platform, :url, :user_id
end
