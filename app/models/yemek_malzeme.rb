class YemekMalzeme < ApplicationRecord
	belongs_to :malzeme
	belongs_to :yemek

	accepts_nested_attributes_for :malzeme, :reject_if => :all_blank

end
