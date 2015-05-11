class AddReportRefs < ActiveRecord::Migration
  def change

    add_reference :reporting_specific_filter_groups, :report, index: true
    add_reference :reporting_specific_filter_groups, :filter_group, index: true
  end
end
