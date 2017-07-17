class Malzeme < ApplicationRecord
	belongs_to :birim
	belongs_to :kategori
	has_many :yemek_malzemes
	has_many :malzeme_altyemeks
	belongs_to :malzeme_kategori
	has_many :yemeks, :through => :yemek_malzemes
	has_many :alt_yemeks, :through => :malzeme_altyemeks

	 def name_with_city
    "#{isim} / #{fiyat} TL / #{self.birim.isim}"
  	end

end
