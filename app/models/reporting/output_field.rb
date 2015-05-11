module Reporting
  class OutputField < ActiveRecord::Base
    belongs_to :report

    validates :name, presence: true
    validates :report, presence: true
    validates :numeric_precision, :numericality => { :greater_than_or_equal_to => 0 }
  end
end
