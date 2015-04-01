class RenameFieldsToFilterFields < ActiveRecord::Migration
  def change
    rename_table :reporting_fields, :reporting_filter_fields
  end
end
