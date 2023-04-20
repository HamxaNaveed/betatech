class ContactsMailer < ApplicationMailer
  def send_email(contact)
    @contact = contact
    mail(to: contact.email, subject: 'Thanks for contacting us', from: 'Beta Tech <official.beta@gmail.com>')
  end
  def admin_email(contact)
    @contact = contact
    mail(to: 'official.betatech@gmail.com', from: 'Beta Tech <official.beta@gmail.com>', subject: 'Someone Contacted you')
  end
end
