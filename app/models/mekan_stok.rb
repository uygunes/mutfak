class MekanStok < ApplicationRecord
	belongs_to :mekan
	belongs_to :stok

	accepts_nested_attributes_for :mekan, :reject_if => :all_blank
	accepts_nested_attributes_for :stok, :reject_if => :all_blank
	
	def self.mekan_malzeme_stok(malzeme_id,mekan_id)
		malzeme = Malzeme.find_by_id(malzeme_id)
		mekan = Mekan.find_by_id(mekan_id)
		
		if malzeme.stok.nil?
			"Malzeme Stok Girisi Yapilmali"
		elsif MekanStok.find_by(stok_id: malzeme.stok.id, mekan_id: mekan.id ).nil? 
			"0"
		else
			MekanStok.find_by(stok_id: malzeme.stok.id, mekan_id: mekan.id ).miktar
		end
	end
end
