class Birim < ApplicationRecord
	default_scope { order(isim: :asc) }
	has_many :malzemes, :dependent => :restrict_with_error
	has_many :yemek_uretims, :dependent => :restrict_with_error
end
