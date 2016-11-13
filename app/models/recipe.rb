class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients
	has_many :directions
	has_many :comments
	acts_as_commentable
	acts_as_nested_set
mount_uploader :image, ImageUploader
	accepts_nested_attributes_for :ingredients,
  															reject_if: proc { |attributes| attributes['name'].blank? },
  															allow_destroy: true
 	accepts_nested_attributes_for :directions,
  															reject_if: proc { |attributes| attributes['step'].blank? },
  															allow_destroy: true

	validates :title, :description, :image, presence: true

end
