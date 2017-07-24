class UserRole < ApplicationRecord
	def normalized
		"#{I18n.transliterate(self.isim).downcase}"
	end
end
