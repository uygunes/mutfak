class YemekUretim < ApplicationRecord
    belongs_to :birim
    belongs_to :yemek
    
    def self.miktar_bul(yemek_id,mekan_id,menu_id,tip)
        yemek_uretim = YemekUretim.find_by(yemek_id: yemek_id,mekan_id: mekan_id,menu_id: menu_id,tip: tip)
        
        if yemek_uretim.nil?
            "Miktar Giriniz"
        else
            "#{yemek_uretim.miktar}"
        end
    end
    
    def self.bul(yemek_id,mekan_id,menu_id,tip)
        YemekUretim.find_by(yemek_id: yemek_id,mekan_id: mekan_id,menu_id: menu_id,tip: tip)
    end
end
