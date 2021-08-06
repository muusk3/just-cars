FactoryBot.define do
  factory :offer do
    title       { format("%<vehicle>s for sale!", vehicle: Faker::Vehicle.make_and_model) }
    description { Faker::Vehicle.standard_specs.join(', ') }
    price       { Faker::Number.decimal(l_digits: 2) }
  end
end
