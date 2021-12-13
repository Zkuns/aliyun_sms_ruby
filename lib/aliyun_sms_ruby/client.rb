require 'erb'
require 'uuid'
require 'json'
require 'openssl'
require 'base64'
require 'faraday'

module AliyunSmsRuby
  class Client
    SERVICE_URL = "http://dysmsapi.aliyuncs.com/"

    def send_request request
      q_without_sig = build_url(request.get_params)
      q_full= "Signature=#{sign(q_without_sig)}&#{q_without_sig}"

      response = Faraday.get "#{SERVICE_URL}?#{q_full}"
      if response != 200 && defined? Rails
        Rails.logger.error(response.body)
      end
    end

    private

    def build_url(hash)
      hash.map{|k,v|"#{encode(k.to_s)}=#{encode(v.to_s)}"}.sort.join('&')
    end

    def encode(str)
      ERB::Util.url_encode str
    end

    def sign(str)
      str = "GET&#{encode('/')}&#{encode(str)}"
      ret = OpenSSL::HMAC.digest('sha1', "#{AliyunSmsRuby.configuration.access_key_secret}&", str)
      ret = Base64.encode64(ret)
      encode(ret.chomp)
    end
  end
end
