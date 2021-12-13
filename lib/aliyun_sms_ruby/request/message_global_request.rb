require 'aliyun_sms_ruby/request/base_request'

module AliyunSmsRuby
  module Request
    class MessageGlobalRequest < BaseRequest
      attr_accessor :mobile, :text, :from, :type, :optional_params

      def initialize(mobile, text, from, type, optional_params = nil)
        self.mobile = mobile
        self.text = text
        self.from = from
        self.type = type
        self.optional_params = optional_params || {}
      end

      def action
        'SendMessageToGlobe'.freeze
      end

      def custom_params
        {
          Message: self.text,
          To: self.mobile,
          From:	self.from,
          Type: self.type
        }.merge!(self.optional_params)
      end
    end
  end
end

