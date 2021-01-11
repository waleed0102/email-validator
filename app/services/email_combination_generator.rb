class EmailCombinationGenerator
  attr_accessor :first_name, :last_name, :url

  def initialize(first_name:, last_name:, url:)
    @first_name = first_name
    @last_name = last_name
    @url = url
  end

  def call
    combinations = []
    combinations << first_name + '.' + last_name + '@' + url
    combinations << first_name + '@' + url
    combinations << first_name + last_name + '@' + url
    combinations << last_name + '.' + first_name + '@' + url
    combinations << first_name[0] + '.' + last_name + '@' + url
    combinations << first_name[0] + last_name[0] + '@' + url

    existing_emails = User.where(email: combinations).pluck(:email)
    combinations - existing_emails
  end
end
