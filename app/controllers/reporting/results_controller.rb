require_dependency "reporting/application_controller"

module Reporting
  class ResultsController < ApplicationController
    def index
      @report = Report.find(params[:report_id])
      @q = @report.data_model.ransack(params[:q])
      @params = {q: params[:q]}

      begin
        @results = @q.result

        # this is used to test if any sql exception is triggered in querying
        # commen errors: table not found
        first_result = @results.first 

        # list all output fields
        # if output_fields is empty, then export all columns in this table
        @fields = @report.output_fields.blank? ?
          @report.data_model.column_names.map{
            |x| {
              name: x 
            }
          } : @report.output_fields

      rescue => e
        # error message handling

        @results = []
        @fields = []
      end

      respond_to do |format|
        format.html
        format.csv { send_data @results.to_csv }
      end

    end
  end
end
