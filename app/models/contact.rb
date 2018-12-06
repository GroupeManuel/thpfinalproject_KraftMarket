class Contact < MailForm::Base
  attribute :name, :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :topic,   :validate => true
  attribute :message,   :validate => true

  def headers
    {
      :subject => "Contact Form",
      :to => "manueltrinquet@gmail.com",
      :from => %("#{name}" <#{topic}> <#{email}>)
    }
  end

end