desc "Seed supported filter types in reporting engine "
task seed_reporting_filter_types: :environment do

  %w(
    eq not_eq 
    matches does_not_match 
    lt gt 
    lteq gteq 
    in not_in 
    cont not_cont 
    cont_any not_cont_any 
    i_cont i_not_cont
    start not_start
    end not_end
    true not_true
    false not_false
    present blank
    null not_null
    range
    select
    multi_select
    ).each do |type|
    Reporting::FilterType.where(name: type).first_or_create
  end
  puts 'Finished seeding reporting filter types.'

end # task

