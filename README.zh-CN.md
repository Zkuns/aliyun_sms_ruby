# AliyunSmsRuby
阿里云的短信服务，支持短信发送状态查询，10DLC

## 安装

```ruby
gem 'aliyun_sms_ruby'
```

## 配置
添加文件 aliyun_sms_ruby.rb 到 config/initializers.

```ruby
AliyunSmsRuby.configure do |config|
  config.access_key_secret = ENV['ALIYUN_SMS_ACCESS_KEY_SECRET']
  config.access_key_id = ENV['ALIYUN_SMS_ACCESS_KEY_ID']
  config.sign_name = ENV['ALIYUN_SMS_SIGN_NAME']
end
```

## 使用

### 短信发送
文档地址: https://next.api.aliyun.com/document/Dysmsapi/2017-05-25/SendSms

``` ruby
phone_number = '151********'
template_code = 'SMS_182823232'
template_param = { code: "10001" }
AliyunSmsRuby.send_message(phone_number, template_code, template_param)
```

### 国际短信发送（不可查询发送状态）
**重要: 注册完10DLC 后需要找阿里云的工单支持把当前的账号加入到阿里云的白名单里才行, 不然就会收到下面的错误**

```
{
  "Code": "Forbidden.Operation",
  "Message":"You are not authorized to perform the operation."
}
```

文档地址: https://help.aliyun.com/document_detail/164194.html

``` ruby
phone_number = '151********'
text = 'code is 19384'
type = 'OTP'
# need register from Aliyun support
from = '18884060817'
AliyunSmsRuby.send_global_message(phone_number, text, from, type)
```

### 短信状态查询
文档地址: https://next.api.aliyun.com/document/Dysmsapi/2017-05-25/QuerySendDetails

``` ruby
phone_number = '151********'
send_date = Time.now.strftime('%Y%m%d')
biz_id = '940902739667766114^0'
AliyunSmsRuby.send_query_request(phone_number, send_date, biz_id, page_size = 1, current_page = 1)
```

### 短信模板查询
Aliyun doc: https://next.api.aliyun.com/document/Dysmsapi/2017-05-25/QuerySmsTemplate

``` ruby
template_code = 'SMS_182823232'
AliyunSmsRuby.send_query_template(template_code)
```