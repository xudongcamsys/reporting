module Reporting
  class Report < ActiveRecord::Base
    has_many :fields

    validates :name, presence: true
    validates :data_source, presence: true

    # model name is based on table name
    def data_model_class_name
      "Reporting::#{data_source.classify}"
    end

    def data_model
      define_data_model data_source, fields
    end

    private

    # define new model for the tables not known to AR
    def define_data_model(table_name, fields)

      if !Object.const_defined?(data_model_class_name)
        klass = Class.new ActiveRecord::Base do 

          # configure table/view name
          self.table_name = table_name

          # model should be readonly (since this is a reporting tool)
          def readonly?
            true
          end

        end

        # configure new model name
        Reporting.const_set table_name.classify, klass
      end

      # define customized ransackers
      fields.each do |field|
        field.ransacker
      end

      # return defined model
      Object.const_get data_model_class_name
    end

  end
end
