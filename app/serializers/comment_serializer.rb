class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at_date, :author, :blog, :blog_id, :user_id

  def author
    object.user.username.capitalize
  end

  def blog
    object.blog.title
  end

  def blog_id
    object.blog_id
  end

  def user_id
    object.user_id
  end

  def created_at_date
    object.created_at.strftime('%b %d, %Y')
  end
end
