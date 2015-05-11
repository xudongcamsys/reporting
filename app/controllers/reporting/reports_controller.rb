require_dependency "reporting/application_controller"

module Reporting
  class ReportsController < ApplicationController
    def index
      @reports = Report.order(:name)
      redirect_to report_path(@reports.first) if @reports.first
    end

    def show
      @reports = Report.order(:name)
      @report = Report.find(params[:id])

      # reset column information
      @report.data_model.reset_column_information

      # find out filter_groups
      @filter_groups = @report.specific_filter_groups.order(:sort_order)
    end
    
  end
end
