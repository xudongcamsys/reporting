module Reporting
  class SpecificFilterGroup < ActiveRecord::Base
    belongs_to :report
    belongs_to :filter_group
  end
end
