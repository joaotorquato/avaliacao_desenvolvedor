FactoryGirl.define do
  factory :register do
    sequence(:buyer) { |n| "Buyer ##{n}" }
    description 'Description test'
    unity_price 10.0
    quantity 1
    address 'Address test'
    supplier 'Supplier test'
  end
end
