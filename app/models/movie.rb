class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  # before_destroy :ensure_no_bookmarks

  # private

  # def ensure_no_bookmarks
  #   unless bookmarks.empty?
  #     errors.add_to_base 'Bookmarked movies cannot be deleted'
  #     throw(:abort)
  #   end
  # end
end
