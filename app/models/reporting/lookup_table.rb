module Reporting
  class LookupTable < ActiveRecord::Base
    has_many :fields

    validates :name, presence: true
  end
end
