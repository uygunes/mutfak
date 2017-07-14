class Restoran < ApplicationRecord
	has_many :restoran_oguns
	has_many :oguns, :through => :restoran_oguns

	accepts_nested_attributes_for :restoran_oguns
    accepts_nested_attributes_for :oguns
end
