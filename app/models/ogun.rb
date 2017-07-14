class Ogun < ApplicationRecord
	has_many :menus 

	has_many :restoran_oguns
	has_many :restorans, :through => :restoran_oguns

	accepts_nested_attributes_for :restoran_oguns
    accepts_nested_attributes_for :restorans
end
