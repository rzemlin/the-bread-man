class Ingredient < ApplicationRecord
    belongs_to :recipe
    belongs_to :user, foreign_key: :recipe
end
