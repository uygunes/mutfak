class RestoranOgun < ApplicationRecord
	belongs_to :restoran
	belongs_to :ogun

	accepts_nested_attributes_for :restoran, :reject_if => :all_blank
end
