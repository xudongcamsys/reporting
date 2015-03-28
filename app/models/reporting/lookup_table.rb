module Reporting
  class LookupTable < ActiveRecord::Base
    has_many :field
  end
end
