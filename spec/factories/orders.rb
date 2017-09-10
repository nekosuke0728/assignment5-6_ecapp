FactoryGirl.define do
  factory :order do
    id 1
    user_id 1
    total_price 10000
    payment_method 0
    firstname '山田'
    lastname '太郎'
    zipcode '1111111'
    prefecture 1
    city 'なんとか市なんとか'
    block '1-1-1'
    building 'なんとかコーポ101'
    phone '00000000000'

    # -----------------------------

    trait :payment_method_is_nil do
      payment_method nil
    end

    trait :firstname_is_nil do
      firstname nil
    end

    trait :lastname_is_nil do
      lastname nil
    end

    trait :zipcode_is_nil do
      zipcode nil
    end

    trait :prefecture_is_nil do
      prefecture nil
    end

    trait :city_is_nil do
      city nil
    end

    trait :block_is_nil do
      block nil
    end

    trait :phone_is_nil do
      phone nil
    end

  end

end


