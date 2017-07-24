class Yemek < ApplicationRecord
    default_scope { order(isim: :asc) }
	has_many :yemek_malzemes, :dependent => :restrict_with_error
	has_many :menu_yemeks, :dependent => :restrict_with_error
    belongs_to :yemek_kategori
    belongs_to :mekan
	has_many :malzemes, :through => :yemek_malzemes, :dependent => :restrict_with_error
	has_many :menus, :through => :menu_yemeks, :dependent => :restrict_with_error
    has_many :alt_yemeks, :dependent => :restrict_with_error

	accepts_nested_attributes_for :yemek_malzemes, allow_destroy: true
    accepts_nested_attributes_for :malzemes
    accepts_nested_attributes_for :menu_yemeks, allow_destroy: true
    accepts_nested_attributes_for :menus
    accepts_nested_attributes_for :alt_yemeks


    def maliyet
    	tutar = 0
    	self.malzemes.each do|malz|
    		tutar = tutar + ((malz.fiyat / malz.miktar) * YemekMalzeme.find_by(yemek_id:self.id,malzeme_id:malz.id).miktar)
    	end
    	tutar
    end

     def maliyetKisi(kisi)
    	tutar = 0
    	carpan = kisi / self.kisi
    	self.malzemes.each do|malz|
    		tutar = tutar + ((malz.fiyat / malz.miktar) * YemekMalzeme.find_by(yemek_id:self.id,malzeme_id:malz.id).miktar)
    	end
    	tutar * carpan
    end

    def kisi_maliyet
    	"#{isim} / #{self.maliyet / self.kisi} KB Maliyet"
    end
end
