module Reporting
  class Report < ActiveRecord::Base
    has_many :fields
  end
end
