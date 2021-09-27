FactoryBot.define do
  factory :item do
    item_name {"item"}
    description {"あああ"}
    category_id {2}
    condition_id {2}
    shipping_cost_id {2}
    area_id {2}
    delivery_day_id {2}
    price {300}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end   
  end
end
