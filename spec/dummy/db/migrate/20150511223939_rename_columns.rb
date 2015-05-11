class RenameColumns < ActiveRecord::Migration
  def change
    remove_reference :reporting_specific_filter_groups, :reporting_report, index: true
    remove_reference :reporting_specific_filter_groups, :reporting_filter_group, index: true
  end
end
