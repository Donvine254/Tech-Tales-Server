class Blog < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates_uniqueness_of :title
  validates_presence_of :image, :title, :body, :slug

  def self.create_blog(title:, body:, user_id:, image:)
    slug = slugify(title)
    blog = self.create(title: title, body: body, user_id: user_id, slug: slug, image: image)
    blog 
  end

  def self.slugify(blog_title)
    blog_title = blog_title.downcase
    blog_title = blog_title.gsub(/[^\w-]/, '-')
    blog_title.gsub(/-+/, '-')
  end
  def comments_count
    comments.count
  end
end
