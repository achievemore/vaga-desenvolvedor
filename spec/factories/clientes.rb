# == Schema Information
#
# Table name: clientes
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :cliente do
    nome { "AchieveMore" }
    arquivo { nil}
  end
end
