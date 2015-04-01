module Reporting
  module Modelable
    extend ActiveSupport::Concern
    
    private 

    def make_a_reporting_model(model_class_name, table_name)
      if !Object.const_defined?(model_class_name)
        klass = Class.new ActiveRecord::Base do 

          # configure table/view name
          self.table_name = table_name

          # model should be readonly (since this is a reporting tool)
          def readonly?
            true
          end

          def self.to_csv(options = {})
            CSV.generate(options) do |csv|
              csv << column_names
              all.each do |row|
                csv << row.attributes.values_at(*column_names)
              end
            end
          end

        end

        # configure new model name
        Reporting.const_set table_name.classify, klass
      end
    end
  end
end