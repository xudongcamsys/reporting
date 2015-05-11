class AddIdFieldNameToReportingLookupTables < ActiveRecord::Migration
  def change
    add_column :reporting_lookup_tables, :id_field_name, :string, null: false, default: 'id'
  end
end
