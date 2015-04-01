module Reporting
  class Report < ActiveRecord::Base
    include Reporting::Modelable

    has_many :filter_fields
    has_many :output_fields

    validates :name, presence: true
    validates :data_source, presence: true

    # model name is based on table name
    def data_model_class_name
      "Reporting::#{data_source.classify}"
    end

    def data_model
      define_data_model
    end

    private

    # define new model for the tables not known to AR
    def define_data_model

      # call modelable module method
      make_a_reporting_model(data_model_class_name, data_source)

      # define customized ransackers
      filter_fields.each do |field|
        field.ransacker
      end

      # return defined model
      Object.const_get data_model_class_name
    end

  end
end
