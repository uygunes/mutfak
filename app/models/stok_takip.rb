class StokTakip < ApplicationRecord
    belongs_to :user
    belongs_to :siparis_formu
    belongs_to :teslimat_formu
    belongs_to :mekan
    belongs_to :menu
    belongs_to :malzeme
    
    def self.malzeme_stok_arttir(teslimat_id,siparis_id,menu_id,mekan_id,malzeme_id,miktar,user_id)
        stok = StokTakip.new()
        stok.teslimat_formu_id = teslimat_id
        stok.siparis_formu_id = siparis_id
        stok.menu_id = menu_id
        stok.mekan_id = mekan_id
        stok.malzeme_id = malzeme_id
        stok.miktar = miktar
        stok.user_id = user_id
        stok.tip = "Teslimat"
        stok.save
        
        malzeme = Malzeme.find_by_id(malzeme_id)
        mekan_stok = MekanStok.find_by(mekan_id: mekan_id, stok_id: malzeme.stok.id)
        if mekan_stok.nil?
            mekan_stok = MekanStok.new()
            mekan_stok.miktar = miktar
            mekan_stok.mekan_id = mekan_id
            mekan_stok.stok_id = malzeme.stok.id
        else
             mekan_stok.miktar = mekan_stok.miktar.to_i + miktar.to_i
        end
       
        mekan_stok.save
    end
    
       def self.malzeme_stok_azalt(mekan_id,menu_id,user_id)
           siparisler = SiparisFormu.where(mekan_id: mekan_id,menu_id: menu_id,onay:true)
           siparisler.each do |siparis|
                stok = StokTakip.new()
                teslimat = TeslimatFormu.find_by(siparis_formu_id: siparis.id)
                puts siparis.id
                stok.teslimat_formu_id = teslimat.id 
                stok.siparis_formu_id = siparis.id
                stok.menu_id = menu_id
                stok.mekan_id = mekan_id
                stok.malzeme_id = siparis.malzeme.id
                stok.miktar = siparis.miktar
                stok.user_id = user_id
                stok.tip = "Tuketim"
                stok.save!
                
                malzeme = Malzeme.find_by_id(siparis.malzeme.id)
                mekan_stok = MekanStok.find_by(mekan_id: mekan_id, stok_id: siparis.malzeme.stok.id)
                if mekan_stok.nil?
                    mekan_stok = MekanStok.new()
                    mekan_stok.miktar = 0 - siparis.miktar.to_i
                    mekan_stok.mekan_id = mekan_id
                    mekan_stok.stok_id = malzeme.stok.id
                else
                     mekan_stok.miktar = mekan_stok.miktar.to_i + siparis.miktar
                end
                mekan_stok.save!
           end
       
    end
end
