class MekanKategori < ApplicationRecord
	default_scope { order(isim: :asc) }
	has_many :mekans, :dependent => :restrict_with_error

end
