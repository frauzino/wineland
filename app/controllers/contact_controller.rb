class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    respond_to do |format|
      if @contact.deliver
        format.html { redirect_to new_contact_path(@contact), notice: 'Message sent successfully' }
        format.json { render json: 'Email sent successfully' }
      else
        format.html { render action: 'new', status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
end
