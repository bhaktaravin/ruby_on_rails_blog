class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }
  
  scope :recent, -> { order(created_at: :desc) }
  scope :published, -> { where.not(published_at: nil) }
  
  def published?
    published_at.present?
  end
  
  def excerpt(limit = 150)
    body.truncate(limit)
  end
end
