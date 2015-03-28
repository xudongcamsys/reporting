FactoryGirl.define do
  factory :reporting_field, :class => 'Reporting::Field' do
    report nil
filter_group nil
filter_type nil
lookup_table nil
name "MyString"
alias "MyString"
is_filterable false
is_output false
is_validate false
  end

end
