require_dependency "reporting/application_controller"

module Reporting
  class ReportsController < ApplicationController
    def index
      @reports = Report.all
    end
  end
end
