class Menu < ApplicationRecord
    default_scope { order(isim: :asc) }
    belongs_to :ogun
    belongs_to :mekan
	has_many :menu_yemeks, :dependent => :restrict_with_error
	has_many :yemeks, :through => :menu_yemeks, :dependent => :restrict_with_error


	accepts_nested_attributes_for :menu_yemeks, allow_destroy: true
    accepts_nested_attributes_for :yemeks


     def maliyet
    	tutar = 0
    	carpan = 0
    	menu_yemek_kisi = 0
        my = MenuYemek.where(menu_id: self.id)
    	my.each do|m|
            menu_yemek_kisi = m.kisi
    		carpan = menu_yemek_kisi / m.yemek.kisi
    		tutar = tutar + (carpan * m.yemek.maliyet)
    	end
    	tutar
    end
end
