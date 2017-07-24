class MenuYemek < ApplicationRecord
	belongs_to :menu
	belongs_to :yemek

	accepts_nested_attributes_for :yemek, :reject_if => :all_blank

	amoeba do
    enable
  end
end
