module Reporting
  class Field < ActiveRecord::Base
    belongs_to :report
    belongs_to :filter_group
    belongs_to :filter_type
    belongs_to :lookup_table

    validates :report, presence: true
    validates :filter_group, presence: true
    validates :filter_type, presence: true
    validates :name, presence: true

    # field associated custom ransacker (base search unit)
    # TODO: probably no need
    def ransacker
      # if lookup_table
      #   report_data_model = Object.const_get(report.data_model_class_name)

      #   if report_data_model
      #     report_data_model.ransacker name.to_sym do |parent|
      #       Arel.sql("#{lookup_table.name}.#{lookup_table.id}")
      #     end
      #   end
      # end
    end
  end
end
