# == Schema Information
#
# Table name: clientes
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cliente < ApplicationRecord
  has_many :resultado

  has_one_attached :arquivo
end
