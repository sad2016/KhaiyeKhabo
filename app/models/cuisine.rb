class Cuisine < ActiveRecord::Base
  has_many :recipes
  accepts_nested_attributes_for :recipes
end
