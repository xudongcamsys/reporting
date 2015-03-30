module Reporting
  class FilterType < ActiveRecord::Base
    has_many :fields
  end
end
