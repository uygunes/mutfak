class Malzeme < ApplicationRecord

 default_scope { order(isim: :asc) }

belongs_to :birim
belongs_to :malzeme_kategori
has_one :stok, dependent: :destroy
has_many :yemek_malzemes, :dependent => :restrict_with_error
has_many :yemeks, :through => :yemek_malzemes, :dependent => :restrict_with_error

accepts_nested_attributes_for :yemek_malzemes
accepts_nested_attributes_for :yemeks
accepts_nested_attributes_for :stok, allow_destroy: true

 def name_with_city
"#{isim} / #{fiyat} TL / #{self.birim.isim}"
	end


	def malzeme_fiyat
		self.fiyat / self.miktar
	end

end
