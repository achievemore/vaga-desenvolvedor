# == Schema Information
#
# Table name: clientes
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ClienteSerializer < ActiveModel::Serializer
  attributes :id, :nome, :arquivo_file
end
