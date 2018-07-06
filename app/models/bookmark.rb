class Bookmark < ApplicationRecord
  belongs_to :topic
  validates :url, presence: true
  validates :url, uniqueness: true

  has_many :likes, dependent: :destroy
end
