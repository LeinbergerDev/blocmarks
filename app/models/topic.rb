class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :delete_all
  validates_associated :bookmarks
  validates :title, presence: true
  validates :title, uniqueness: true

end
