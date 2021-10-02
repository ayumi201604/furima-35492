FactoryBot.define do
  factory :order do
    token {"***************"}
    postal_code {"123-4567"}
    area_id {2}
    municipalitie {"函館市本町"}
    address {"12-45"}
    building_name {"本町ビル"}
    telephone_number {"09012345678"}
  end
end
