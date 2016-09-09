class Comment < ApplicationRecord
  validates :body, presence: true
  validates :article_id, presence: true
end
