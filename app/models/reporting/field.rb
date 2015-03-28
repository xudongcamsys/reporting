module Reporting
  class Field < ActiveRecord::Base
    belongs_to :report
    belongs_to :filter_group
    belongs_to :filter_type
    belongs_to :lookup_table
  end
end
