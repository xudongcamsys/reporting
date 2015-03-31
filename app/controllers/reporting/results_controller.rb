require_dependency "reporting/application_controller"

module Reporting
  class ResultsController < ApplicationController
    def show
      @report = Report.find(params[:report_id])
      @q = @report.data_model.ransack(params[:q])

      @results = @q.result
    end
  end
end
