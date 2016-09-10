FactoryGirl.define do
  factory :comment do
    body "MyText"
    article_id "1"
    email "email@random.com"
  end
end
