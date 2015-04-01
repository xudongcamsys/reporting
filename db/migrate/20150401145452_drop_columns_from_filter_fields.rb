class DropColumnsFromFilterFields < ActiveRecord::Migration
  def change
    remove_column :reporting_filter_fields, :is_filterable
    remove_column :reporting_filter_fields, :is_output
    remove_column :reporting_filter_fields, :is_validate
  end
end
