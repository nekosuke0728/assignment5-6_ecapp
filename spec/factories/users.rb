FactoryGirl.define do
  factory :user do
    id 1
    email "user1@sample.com"
    password "password"
    nickname "user1"

    # -----------------------------

    trait :email_is_nil do
      email nil
    end

    trait :password_is_nil do
      password nil
    end

    trait :nickname_is_nil do
      nickname nil
    end

  end
end



