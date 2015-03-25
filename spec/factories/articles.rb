FactoryGirl.define do
  factory :article do
    title "Some Title"
    body  "Some body"

    published_at { 1.day.ago }

    trait :featured do
      featured_at { 1.day.ago }
    end
  end
end
