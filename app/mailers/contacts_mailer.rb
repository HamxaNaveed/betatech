class ContactsMailer < ApplicationMailer
  def send_email(contact)
    @contact = contact
    mail(to: contact.email, subject: 'Thanks for contacting us', from: 'Beta Tech <official.beta@gmail.com>')
  end
end
