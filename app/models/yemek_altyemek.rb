class YemekAltyemek < ApplicationRecord
	belongs_to :alt_yemek
	belongs_to :yemek

	accepts_nested_attributes_for :yemek, :reject_if => :all_blank
	accepts_nested_attributes_for :alt_yemek, :reject_if => :all_blank
end
