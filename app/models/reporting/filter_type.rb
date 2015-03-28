module Reporting
  class FieldType < ActiveRecord::Base
    has_many :field
  end
end
