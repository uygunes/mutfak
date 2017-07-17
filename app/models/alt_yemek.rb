class AltYemek < ApplicationRecord
	has_many :yemeks, :through => :yemek_altyemeks
	has_many :malzemes, :through => :malzeme_altyemeks
	has_many :menus, :through => :menu_altyemeks
	has_many :yemek_altyemeks
	has_many :malzeme_altyemeks
	has_many :menu_altyemeks

	accepts_nested_attributes_for :yemek_altyemeks
	accepts_nested_attributes_for :yemeks

	accepts_nested_attributes_for :malzeme_altyemeks
	accepts_nested_attributes_for :malzemes

	accepts_nested_attributes_for :menus
	accepts_nested_attributes_for :menu_altyemeks
end
