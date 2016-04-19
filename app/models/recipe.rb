class Recipe < ActiveRecord::Base
  belongs_to :cuisine
  belongs_to :cookcategory
  belongs_to :user

  has_many :comments, dependent: :destroy


  ratyrate_rateable 'recipe'
  mount_uploader :picture, RecipeUploader
end
