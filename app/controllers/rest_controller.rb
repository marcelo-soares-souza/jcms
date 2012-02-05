class RestController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def texts
    @texts = Text.all

    respond_with(@texts)
 end

end
