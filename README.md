# AliyunSmsRuby
This gem use for Aliyun message send and status query.

Add 10DLC support

## Installation

```ruby
gem 'aliyun_sms_ruby'
```

## Config
Add aliyun_sms_ruby.rb to config/initializers.

```ruby
AliyunSmsRuby.configure do |config|
  config.access_key_secret = ENV['ALIYUN_SMS_ACCESS_KEY_SECRET']
  config.access_key_id = ENV['ALIYUN_SMS_ACCESS_KEY_ID']
  config.sign_name = ENV['ALIYUN_SMS_SIGN_NAME']
end
```

## Use

### Message send
Aliyun doc: https://next.api.aliyun.com/document/Dysmsapi/2017-05-25/SendSms

``` ruby
phone_number = '151********'
template_code = 'SMS_182823232'
template_param = { code: "10001" }
AliyunSmsRuby.send_message(phone_number, template_code, template_param)
```

### Global message send(can not query message send status)
**Important: After register the 10 DLC number, you need ask the Aliyun support team add your account to their white list. Or you will receive a forbidden error.**

```
{
  "Code": "Forbidden.Operation",
  "Message":"You are not authorized to perform the operation."
}
```

Aliyun doc: https://help.aliyun.com/document_detail/164194.html

``` ruby
phone_number = '151********'
text = 'code is 19384'
type = 'OTP'
# need register from Aliyun support
from = '18884060817'
AliyunSmsRuby.send_global_message(phone_number, text, from, type)
```

### Message status query
Aliyun doc: https://next.api.aliyun.com/document/Dysmsapi/2017-05-25/QuerySendDetails

``` ruby
phone_number = '151********'
send_date = Time.now.strftime('%Y%m%d')
biz_id = '940902739667766114^0'
AliyunSmsRuby.send_query_request(phone_number, send_date, biz_id, page_size = 1, current_page = 1)
```

### Tempalte query
Aliyun doc: https://next.api.aliyun.com/document/Dysmsapi/2017-05-25/QuerySmsTemplate

``` ruby
template_code = 'SMS_182823232'
AliyunSmsRuby.send_query_template(template_code)
```
