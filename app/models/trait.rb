class Trait < ApplicationRecord
	has_many :trait_genre

	accepts_nested_attributes_for :trait_genre,
           :reject_if => :all_blank,
           :allow_destroy => true
end
