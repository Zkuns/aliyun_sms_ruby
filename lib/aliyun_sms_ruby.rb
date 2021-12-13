require 'aliyun_sms_ruby/configuration'
require 'aliyun_sms_ruby/client'
require 'aliyun_sms_ruby/request/message_request'
require 'aliyun_sms_ruby/request/message_global_request'

module AliyunSmsRuby
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def send_message(mobile, template_code, template_param, optional_params = nil)
      request = AliyunSmsRuby::Request::MessageRequest.new(mobile, template_code, template_param, optional_params = nil)
      client.send_request request
    end

    def send_global_message(mobile, text, from, type, optional_params = nil)
      request = AliyunSmsRuby::Request::MessageGlobalRequest.new(mobile, text, from, type, optional_params = nil)
      client.send_request request
    end

    private
    def client
      @client ||= AliyunSmsRuby::Client.new
    end
  end
end
