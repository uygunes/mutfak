class Menu < ApplicationRecord
    belongs_to :ogun
	has_many :menu_yemeks
	has_many :yemeks, :through => :menu_yemeks

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
