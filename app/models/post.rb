class Post < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user, optional: true
  
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }
  
  scope :recent, -> { order(created_at: :desc) }
  scope :published, -> { where.not(published_at: nil) }
  scope :by_category, ->(category) { where(category: category) }
  
  def published?
    published_at.present?
  end
  
  def excerpt(limit = 150)
    body.truncate(limit)
  end

  def author_name
    user&.display_name || "Anonymous"
  end
end
