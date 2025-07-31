class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  
  before_validation :generate_slug
  
  scope :with_posts, -> { joins(:posts).distinct }
  
  def to_param
    slug
  end
  
  def posts_count
    posts.count
  end
  
  private
  
  def generate_slug
    self.slug = name.parameterize if name.present? && slug.blank?
  end
end
