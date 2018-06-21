class Bookmark < ApplicationRecord
  belongs_to :topic
  validates :url, presence: true
  validates :url, uniqueness: true
end
