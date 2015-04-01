module Reporting
  class OutputField < ActiveRecord::Base
    belongs_to :report

    validates :name, presence: true
    validates :report, presence: true
  end
end
