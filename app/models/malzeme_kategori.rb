class MalzemeKategori < ApplicationRecord
	has_many :malzemes, :dependent => :restrict_with_error
end
