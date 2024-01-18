class Cliente < ApplicationRecord
  has_many :resultado

  validates :nome, presence: true
end
