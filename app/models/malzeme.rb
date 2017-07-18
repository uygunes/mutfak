class Malzeme < ApplicationRecord
before_destroy :check_if_used

def check_if_used
  return false if self.yemeks.exists?
end


	belongs_to :birim
	has_many :yemek_malzemes
	has_many :malzeme_altyemeks
	belongs_to :malzeme_kategori
	has_many :yemeks, :through => :yemek_malzemes

	 def name_with_city
    "#{isim} / #{fiyat} TL / #{self.birim.isim}"
  	end

end
