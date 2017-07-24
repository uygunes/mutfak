class MekanStok < ApplicationRecord
	belongs_to :mekan
	belongs_to :stok

	accepts_nested_attributes_for :mekan, :reject_if => :all_blank
	accepts_nested_attributes_for :stok, :reject_if => :all_blank
end
