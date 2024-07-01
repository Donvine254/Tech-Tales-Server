class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :picture, :bio, :role, :socials
  def socials
    object.social_media.map do |social_medium|
      { id: social_medium.id, platform: social_medium.platform, url: social_medium.url }
    end
  end
end
