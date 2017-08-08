class SiparisFormu < ApplicationRecord
    belongs_to :malzeme
    belongs_to :menu
    belongs_to :mekan
    
    def mekan_bazli_siparis(mekan_id)
        self.select{|mekan| mekan.mekan_id = mekan_id}
    end
    
    def self.mekan_menu_siparis(mekan_id,menu_id)
        self.where(:menu_id => menu_id, :mekan_id => mekan_id)
    end
    
    def self.onayli(mekan_id,menu_id)
        onayli = "Onay Bekliyor"
        SiparisFormu.mekan_menu_siparis(mekan_id,menu_id).each do|malzeme|
            if malzeme.onay
                onayli = "Onayli"
            else
                onayli = "Onay Bekliyor"
            end
            
        end
        onayli
    end
end
