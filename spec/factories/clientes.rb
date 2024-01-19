FactoryBot.define do
  factory :cliente do
    nome { Faker::Name.name }
  end
end
