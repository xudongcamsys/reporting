module Reporting
  class Report < ActiveRecord::Base
    has_many :field
  end
end
