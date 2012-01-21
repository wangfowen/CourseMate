class FrontendsController < ApplicationController
  # GET /frontends
  # GET /frontends.json
  def index
    @display = "Hello app"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frontends }
    end
  end
end