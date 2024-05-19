FactoryBot.define do
  factory :borrow do
    due_date { DateTime.now(+2.weeks) }
    overdue_date { nil }
    return_date { nil }
    returned { false }
    start_date { DateTime.now }
    association :book
    association :user
  end
end
