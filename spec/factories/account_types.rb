# Read about factories at http://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :assets, :class => AccountType do
    name "Assets"
    code "assets"
    note "Asset Desc"
  end
end
