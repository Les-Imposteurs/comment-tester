class ContactFormSubmissionsController < ApplicationController
  def new
    @submission = ContactFormSubmission.new
  end

  def create
    redirect_to('/thank_you')
  end

  def thank_you
    
  end
end
