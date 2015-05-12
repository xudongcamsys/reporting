require 'csv'

module Reporting
  class CsvService
    include Reporting::ReportHelper

    attr_reader :report, :data, :fields

    def initialize(report, data, fields)
      @report = report
      @data = data 
      @fields = fields
    end

    def get_output
      # Excel is stupid if the first two characters of a csv file are "ID". Necessary to
      # escape it. https://support.microsoft.com/kb/215591/EN-US
      headers = []
      @fields.each do |field|
        headers << (field[:title].blank? ? field[:name] : field[:title])
      end

      if headers[0].start_with? "ID"
        headers = Array.new(headers)
        headers[0] = "'" + headers[0]
      end
      
      # refresh primary_key in case it's changed
      @report.data_model.primary_key = @report.primary_key

      Enumerator.new do |y|
        CSV.generate do |csv|
          y << headers.to_csv

          # find_each would reduce memory usage, but it relies on valid primary_key
          @data.find_each do |row|
            y << fields.map { |field|
              format_output row.send(field[:name]), 
                @report.data_model.columns_hash[field[:name].to_s].type,  
                field[:formatter]
            }.to_csv
          end
        end
      end
    end
  end
end
