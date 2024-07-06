class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :slug, :image, :created_at_date, :author, :tags, :user_id, :user_avatar, :user_bio, :author_socials
  has_many :comments

  def created_at_date
    object.created_at.strftime("%b %d, %Y") 
  end
  def author
    object.user.username.capitalize!
  end
  def user_id
    object.user.id
  end
  def user_bio
    object.user.bio
  end
  def author_socials
    object.user.socials
  end
def user_avatar
object.user.picture
end
end
