class Malzeme < ApplicationRecord
	belongs_to :birim
	has_many :yemek_malzemes
	belongs_to :malzeme_kategori
	has_many :yemeks, :through => :yemek_malzemes

	 def name_with_city
    "#{isim} / #{fiyat} TL / #{self.birim.isim}"
  	end

end
