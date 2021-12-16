module AliyunSmsRuby
  class Configuration
    attr_accessor :access_key_secret, :access_key_id, :format, :region_id,
                  :sign_name, :signature_method, :signature_version, :version

    def initialize
      @access_key_secret = ''
      @access_key_id = ''
      @format = 'JSON'
      @region_id = 'cn-hangzhou'
      @sign_name = ''
      @signature_method = 'HMAC-SHA1'
      @signature_version = '1.0'
      @version = '2017-05-25'
    end
  end
end
