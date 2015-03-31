module Reporting
  class FilterType < ActiveRecord::Base
    has_many :fields

    validates :name, presence: true
  end
end
