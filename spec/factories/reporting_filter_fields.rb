FactoryGirl.define do
  factory :reporting_filter_field, :class => 'Reporting::Field' do
    report nil
    filter_group nil
    filter_type nil
    lookup_table nil
    name "MyString"
    title "MyString"
  end

end
