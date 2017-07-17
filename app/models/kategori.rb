class Kategori < ApplicationRecord
	has_many :yemeks
	has_many :malzemes
end
