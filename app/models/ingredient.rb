class Ingredient < ApplicationRecord
    belongs_to :user, through: :recipe
end
