module AliyunSmsRuby
  module Request
    class BaseRequest

      def get_params
        custom_params.merge intrinsic_params
      end

      protected

      def action
        ""
      end

      def custom_params
        {}
      end

      def intrinsic_params
        configuration = AliyunSmsRuby.configuration
        {
          :AccessKeyId => configuration.access_key_id,
          :SignName => configuration.sign_name,
          :Format => configuration.format,
          :RegionId => configuration.region_id,
          :SignatureMethod => configuration.signature_method,
          :SignatureVersion => configuration.signature_version,
          :Timestamp => timestamp,
          :SignatureNonce => nonce,
          :Action => action,
          :Version => configuration.version
        }
      end

      def timestamp
        Time.now.utc.strftime("%FT%TZ")
      end

      def nonce
        UUID.generate
      end
    end
  end
end
