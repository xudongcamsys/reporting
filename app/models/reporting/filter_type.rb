module Reporting
  class FilterType < ActiveRecord::Base
    has_many :filter_fields

    validates :name, presence: true
  end
end
