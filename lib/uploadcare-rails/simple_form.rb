require 'uploadcare-rails'

module SimpleForm::Inputs
  class UploadcareInput < Base
    def input
      config  = ::Uploadcare::Rails.config
      options = {}
      options[:role] ||= case config["widget_type"]
        when "plain"
          "uploadcare-plain-uploader"
        when "line"
          "uploadcare-line-uploader"
        else
          "uploadcare-plain-uploader"
        end
      options["data-public-key"] ||= config["public_key"]
      options[:type] ||= "hidden"

      "#{@builder.input_field(attribute_name, input_html_options.merge(options))}".html_safe
    end
  end
end