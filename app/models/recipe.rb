class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients
	has_many :directions
	has_many :comments
	acts_as_commentable
mount_uploader :image, ImageUploader
	accepts_nested_attributes_for :ingredients,
  															reject_if: proc { |attributes| attributes['name'].blank? },
  															allow_destroy: true
 	accepts_nested_attributes_for :directions,
  															reject_if: proc { |attributes| attributes['step'].blank? },
  															allow_destroy: true

	validates :title, :image, :cuisine_type, :meal_type, :ingredients, :directions, presence: true
  def self.search(search)
    if search
      where(["title LIKE ?", "%#{search}%"])
    else
      all
    end
  end
end
