class MalzemeAltyemek < ApplicationRecord
	belongs_to :malzeme
	belongs_to :alt_yemek

	accepts_nested_attributes_for :malzeme, :reject_if => :all_blank
	accepts_nested_attributes_for :alt_yemek, :reject_if => :all_blank
end
