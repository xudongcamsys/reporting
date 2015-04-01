require_dependency "reporting/application_controller"

module Reporting
  class ResultsController < ApplicationController
    def index
      @report = Report.find(params[:report_id])
      @q = @report.data_model.ransack(params[:q])
      @params = {q: params[:q]}

      # TODO: if output_fields is empty, then use .attributes
      @fields = @report.output_fields

      begin
        @results = @q.result

        # this is used to test if any sql exception is triggered in querying
        # commen errors: table not found
        first_result = @results.first 
      rescue => e
        # error message handling

        @results = []
      end

      respond_to do |format|
        format.html
        format.csv { send_data @results.to_csv }
      end

    end
  end
end
