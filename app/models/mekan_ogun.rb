class MekanOgun < ApplicationRecord
	belongs_to :mekan
	belongs_to :ogun

	accepts_nested_attributes_for :mekan, :reject_if => :all_blank
	accepts_nested_attributes_for :ogun, :reject_if => :all_blank
end
