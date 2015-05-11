module Reporting
  class FilterField < ActiveRecord::Base
    belongs_to :filter_group
    belongs_to :filter_type
    belongs_to :lookup_table

    validates :filter_group, presence: true
    validates :filter_type, presence: true
    validates :name, presence: true
    validates :sort_order, presence: true
  end
end
