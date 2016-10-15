class Post < ApplicationRecord
  validates :title, :presence => true
  has_many :comments
def self.search(search)
  # Title is for the above case, the OP incorrectly had 'name'
  where("title LIKE ?", "%#{search}%")
end
end

  