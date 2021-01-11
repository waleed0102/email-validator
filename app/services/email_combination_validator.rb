class EmailCombinationValidator
  attr_accessor :emails

  def initialize(emails:)
    @emails = emails
    @base_url = 'http://apilayer.net/api/check'
    @api_key = Rails.application.credentials[:email_validator_service_api_key]
  end

  def call
    selected = nil
    emails.each do |email|
      response = make_api_call(email)

      if response
        selected = email
        break
      end
    end
    selected
  end

  private

  def make_api_call(email)
    url = @base_url + "?access_key=#{@api_key}&email=#{email}&smtp=1&format=1"
    response = HTTParty.get(url)
    if response.code == 200
      body = JSON.parse response.body
      return true if body['format_valid'] && body['mx_found'] && body['smtp_check'] && !body['catch_all']
    end
    false
  end
end
