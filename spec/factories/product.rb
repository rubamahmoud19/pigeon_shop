FactoryBot.define do
  factory :product do
    name { Faker::Creature::Bird.order }
    price { 100 }
    code { rand(1000..2000) }
  end

end
