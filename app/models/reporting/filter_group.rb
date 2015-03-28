module Reporting
  class FilterGroup < ActiveRecord::Base
    has_many :field
  end
end
