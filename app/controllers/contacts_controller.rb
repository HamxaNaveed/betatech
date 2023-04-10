class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_u_params)
    respond_to do |format|
      if @contact.save
        ContactsMailer.send_email(@contact).deliver_now
        format.html { redirect_to root_path, notice: "Thanks for your Submission, We will contact you soon" }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def contact_u_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end