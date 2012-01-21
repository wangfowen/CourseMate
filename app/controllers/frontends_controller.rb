class FrontendsController < ApplicationController

  require 'json'
  require 'open-uri'

  before_filter :authenticate_user

  # GET /frontends
  # GET /frontends.json
  def index
    @graph = Koala::Facebook::API.new(session[:access_token])
    
    #@display = @graph.get_object("me")["education"]
    #find user's university, if it exists in list, univ_id = it
    #else create in univ model and then save univ_id = it
    if @user.univ_id.nil?
      @user.update_univ!('1')
    end

    if @user.course_list.nil?
      @body = 'upload'
      #@display = @graph.get_connections("me", "albums")
    else
      #do a join on your courses and your friends' courses
      #@variable = list of friends with same courses
      @body = 'results'
      #render partial for show who's in your classes
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frontends }
    end
  end

  def find_friends courses_array
    temp = Courses.parse_course_infos(courses_array, @user.univ_id)
    #@user.update_course_list!(temp)
    redirect_to "http://apps.facebook.com/coursemateapp/"
  end

  def upload_file
    img_url = params[:upload][:upload_file]
    url = URI.parse("http://coursemateservice.apphb.com/service1/#{img_url}")
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    courses_array = ActiveSupport::JSON.decode( res.body.gsub(/\<\S*\>/, '').gsub(/\<[\S\s]*\>/, ''))
    find_friends(courses_array)
  end

end
