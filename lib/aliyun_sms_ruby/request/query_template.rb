require 'aliyun_sms_ruby/request/base_request'

module AliyunSmsRuby
  module Request
    class QueryTemplate < BaseRequest
      attr_accessor :template_code

      def initialize(template_code)
        self.template_code = template_code
      end

      def action
        "QuerySmsTemplate".freeze
      end

      def custom_params
        {
          :TemplateCode => template_code
        }
      end
    end
  end
end
