require_dependency "reporting/application_controller"

module Reporting
  class ResultsController < ApplicationController
    def show
      @report = Report.find(params[:report_id])
      @q = @report.data_model.ransack(params[:q])

      begin
        @results = @q.result

        # this is used to test if any sql exception is triggered in querying
        # commen errors: table not found
        first_result = @results.first 
      rescue => e
        # error message handling

        @results = []
      end

    end
  end
end
