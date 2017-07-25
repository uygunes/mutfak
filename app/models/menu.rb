class Menu < ApplicationRecord
    default_scope { order(isim: :asc) }
    belongs_to :ogun
    belongs_to :mekan
	has_many :menu_yemeks, :dependent => :restrict_with_error
	has_many :yemeks, :through => :menu_yemeks, :dependent => :restrict_with_error


	accepts_nested_attributes_for :menu_yemeks, allow_destroy: true
    accepts_nested_attributes_for :yemeks

    amoeba do
        enable
    end

     def maliyet
    	tutar = 0
    	carpan = 0
    	menu_yemek_kisi = 0
        my = MenuYemek.where(menu_id: self.id)
    	my.each do|m|
            menu_yemek_kisi = m.kisi
            if menu_yemek_kisi.nil?
                carpam = self.kisi / m.yemek.kisi
            else
    		    carpan = menu_yemek_kisi / m.yemek.kisi
            end
    		tutar = tutar + (carpan * m.yemek.maliyet)
    	end
    	tutar
    end

    def gerekli_malzemeler
        malzeme_listesi = Hash.new(0)
        self.yemeks.each do |x|
            x.malzemes.each do |y|
                malzeme_listesi[y.id] += (MenuYemek.find_by(yemek_id:x.id,menu_id:self.id).kisi / x.kisi) * YemekMalzeme.find_by(yemek_id:x.id,malzeme_id: y.id).miktar
            end
        end
        malzeme_listesi
    end

    def kopyala
        ex = self.amoeba_dup
        ex
    end
end
