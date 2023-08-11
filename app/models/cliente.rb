class Cliente < ApplicationRecord
  validates :nome, presence: :true

  has_many :resultado
end
