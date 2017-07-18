class Malzeme < ApplicationRecord



belongs_to :birim
has_many :yemek_malzemes, :dependent => :restrict_with_error
belongs_to :malzeme_kategori
has_many :yemeks, :through => :yemek_malzemes, :dependent => :restrict_with_error

 def name_with_city
"#{isim} / #{fiyat} TL / #{self.birim.isim}"
	end

end
