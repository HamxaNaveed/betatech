class ContactsMailer < ApplicationMailer
  def send_email(contact)
    @contact = contact
    mail(to: contact.email, subject: 'Thank you for contacting us')
  end
end
