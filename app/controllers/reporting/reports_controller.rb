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

      # find out filter_groups
      @filter_groups = FilterGroup.where(id: @report.fields.pluck(:filter_group_id).uniq)
    end
    
  end
end
