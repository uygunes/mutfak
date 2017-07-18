class AltYemek < ApplicationRecord
	belongs_to :yemek


	 def tanim
    "#{self.yemek.isim}" if self.yemek.present?
  	end
end
