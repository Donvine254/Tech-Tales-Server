class Blog < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates_uniqueness_of :title
  validates_presence_of :title, :body, :slug, :user_id
validates :tags, length: { maximum: 100 }
  def self.create_blog(blog_params)
    slug = slugify(blog_params[:title])
    create!(blog_params.merge(slug: slug))
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
