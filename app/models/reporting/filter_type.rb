module Reporting
  class FilterType < ActiveRecord::Base
    ## 
    # Filter types include any operation types in Ransack
    # Plus, following types:
    SELECT = 'select'
    MULTI_SELECT = 'multi_select'
    RANGE = 'range'
    
    has_many :filter_fields

    validates :name, presence: true
  end
end
