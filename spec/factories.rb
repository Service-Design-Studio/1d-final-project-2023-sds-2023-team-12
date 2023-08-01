FactoryBot.define do
    factory :user do
      email { "test@gmail.com" }
      password { "test123" }
      full_name { "Factory bot" }
      mobile_phone { "97755169" }
    end


    factory :post do
        full_name {"test"}
        age {32}
        location {"test"}
        description {"test"}
        special_note {"test"}
        user_id {1}
        missing_time {"Sat, 17 Jun 2023 21:33:00 +0000"}
        gender {"female"}
        reward {1000}
    end
end