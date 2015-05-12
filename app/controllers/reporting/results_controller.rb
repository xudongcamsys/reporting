require_dependency "reporting/application_controller"

module Reporting
  class ResultsController < ApplicationController
    helper Reporting::ReportHelper

    def index
      q_param = params[:q]
      page = params[:page]
      @per_page = params[:per_page] || Kaminari.config.default_per_page

      @report = Report.find params[:report_id]
      @q = @report.data_model.ransack q_param
      @params = {q: q_param}

      # list all output fields
      # if output_fields is empty, then export all columns in this table
      @fields = @report.output_fields.blank? ?
        @report.data_model.column_names.map{
          |x| {
            name: x 
          }
        } : @report.output_fields

      # default order by :id
      if !@report.data_model.columns_hash.keys.index("id").nil? 
        @q.sorts = "id asc" if @q.sorts.empty?
      end

      # total_results is for exporting
      total_results = @q.result(:district => true)
      
      # @results is for html display; only render current page
      @results = total_results.page(page).per(@per_page)

      # this is used to test if any sql exception is triggered in querying
      # commen errors: table not found
      first_result = @results.limit(1) 

      respond_to do |format|
        format.html
        format.csv do 
          render_csv("#{@report.name.underscore}.csv", total_results, @fields)
        end
      end

    end

    private 

    def render_csv(file_name, data, fields)
      set_file_headers file_name
      set_streaming_headers

      response.status = 200

      #setting the body to an enumerator, rails will iterate this enumerator
      self.response_body = CsvService.new(@report, data, fields).get_output
    end


    def set_file_headers(file_name)
      headers["Content-Type"] = "text/csv"
      headers["Content-disposition"] = "attachment; filename=\"#{file_name}\""
    end


    def set_streaming_headers
      #nginx doc: Setting this to "no" will allow unbuffered responses suitable for Comet and HTTP streaming applications
      headers['X-Accel-Buffering'] = 'no'

      headers["Cache-Control"] ||= "no-cache"
      headers.delete("Content-Length")
    end

  end
end
