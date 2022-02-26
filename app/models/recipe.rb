class Recipe < ApplicationRecord
    belongs_to :user, :optional => true
    has_many :ingredients
end
