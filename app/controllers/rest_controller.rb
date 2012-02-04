class RestController < ApplicationController
  respond_to :json

  def texts
    @texts = Text.all

    respond_with(@texts)
 end

end
