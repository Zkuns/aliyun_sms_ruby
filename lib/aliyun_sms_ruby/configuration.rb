module AliyunSmsRuby
  class Configuration
    attr_accessor :access_key_secret, :access_key_id, :format, :region_id,
                  :sign_name, :signature_method, :signature_version, :version

    def initialize
      @access_key_secret = ''
      @access_key_id = ''
      @format = ''
      @region_id = ''
      @sign_name = ''
      @signature_method = ''
      @signature_version = ''
      @version = ''
    end
  end
end
