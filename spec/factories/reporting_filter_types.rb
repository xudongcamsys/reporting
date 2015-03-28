FactoryGirl.define do
  factory :reporting_filter_type, :class => 'Reporting::FilterType' do
    name "MyString"
partial "MyString"
formatter "MyString"
  end

end
