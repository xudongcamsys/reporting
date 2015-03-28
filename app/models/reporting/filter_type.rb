module Reporting
  class FilterType < ActiveRecord::Base
    has_many :field
  end
end
