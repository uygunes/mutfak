class Menu < ApplicationRecord
    default_scope { order(isim: :asc) }
    belongs_to :ogun
    belongs_to :mekan
	has_many :menu_yemeks, :dependent => :restrict_with_error
	has_many :yemeks, :through => :menu_yemeks, :dependent => :restrict_with_error


	accepts_nested_attributes_for :menu_yemeks
    accepts_nested_attributes_for :yemeks


     def maliyet
    	tutar = 0
    	carpan = 0
    	kisi_katsayi = self.kisi 
    	self.yemeks.each do|yemek|
    		carpan = self.kisi / yemek.kisi
    		tutar = tutar + (carpan * yemek.maliyet)
    	end
    	tutar
    end
end
