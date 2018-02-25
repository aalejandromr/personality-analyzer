class TraitGenre < ApplicationRecord
	belongs_to :trait
	belongs_to :genre

	def self.get_genre_names_by_trait(trait_name)
		temp_trait = Trait.where(:trait_name => trait_name)
		temp_array = Array.new
		temp = Array.new
		temp_trait.each do |trait| temp_array << trait.id end
		temp_array.each do |trait| temp << TraitGenre.where(:trait_id => trait) end
		return temp
	end
end
