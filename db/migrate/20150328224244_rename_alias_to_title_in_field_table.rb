class RenameAliasToTitleInFieldTable < ActiveRecord::Migration
  def change
    rename_column :reporting_fields, :alias, :title
  end
end
