class FrontendsController < ApplicationController

  #before_filter :authenticate_user

  # GET /frontends
  # GET /frontends.json
  def index
    #@graph = Koala::Facebook::API.new(@access_token)
    @display = "Hello app"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frontends }
    end
  end
end