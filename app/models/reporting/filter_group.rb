module Reporting
  class FilterGroup < ActiveRecord::Base
    has_many :fields
  end
end
