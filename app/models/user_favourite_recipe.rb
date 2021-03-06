class UserFavouriteRecipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  # Ensure that Yummly ID is always recorded
  validates :yummly_id, { presence: true }

  # Check if recipe with given Yummly ID already has favourites
  def self.has_user_favourites_for_recipe?(user_id, yummly_id)
    return self.find_by(user_id: user_id, yummly_id: yummly_id)
  end

  def find_recipe_name
  	return Recipe.find(self.recipe_id).name
  end

  def find_recipe_thumbnail
  	return Recipe.find(self.recipe_id).thumbnail
  end
end
