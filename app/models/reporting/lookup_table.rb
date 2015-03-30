module Reporting
  class LookupTable < ActiveRecord::Base
    has_many :fields
  end
end
