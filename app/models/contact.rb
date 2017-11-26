class Contact < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone
  attribute :address
  attribute :message, :validate => true
  attribute :nickname, :captcha  => true

  def headers
    {
      :subject => "Contact Us",
      :to => "#{Rails.configuration.default['ECOMMERCE_GMAIL_USERNAME']}",
      :from => "#{email}",
      :reply_to => "#{email}"
    }
  end
end