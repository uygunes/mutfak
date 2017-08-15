class TeslimatFormu < ApplicationRecord
    has_many :siparis_formus
    has_many :users
    has_many :stok_takips
end
