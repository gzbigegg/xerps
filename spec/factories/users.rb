# Read about factories at http://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :normal_user, :class => User do
    email 'yliu@example.com'
    password 'gogogogo'
    password_confirmation 'gogogogo'
    admin false
  end
  
  factory :admin_user, :class => User do
    email 'shan@example.com'
    password 'gogogogo'
    password_confirmation 'gogogogo'
    admin true
  end
end
