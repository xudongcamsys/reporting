module Reporting
  class FilterGroup < ActiveRecord::Base
    has_many :fields

    validates :name, presence: true
  end
end
