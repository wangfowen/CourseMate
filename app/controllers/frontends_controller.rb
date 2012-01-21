class FrontendsController < ApplicationController

  before_filter :authenticate_user

  # GET /frontends
  # GET /frontends.json
  def index
    @graph = Koala::Facebook::API.new(session[:access_token])
    @display = @graph.get_object("me")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frontends }
    end
  end
end