FactoryBot.define do
  factory :endorsement do
    body { "MyText" }
    user { nil }
    endorser_id { 1 }
  end
end
