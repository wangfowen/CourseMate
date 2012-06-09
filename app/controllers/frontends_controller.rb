class FrontendsController < ApplicationController

  require 'json'
  require 'open-uri'

  before_filter :authenticate_user

  # GET /frontends
  # GET /frontends.json
  def index
    @graph = Koala::Facebook::API.new(session[:access_token])
    #@display = @graph.get_object("me")["education"]

    if @user.univ_id.nil?
      @user.update_univ!('1')
    end

    #if there's no course list, OCR the schedule
    if @user.course_list.nil?
      @body = 'upload'
      #@display = @graph.get_connections("me", "albums")
    #if the user has a course list, match with their friends
    else
      @friends = @user.match_friends_course_lists @graph.get_connections('me', 'friends').map { |a| a["id"]}
      @body = 'results'
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frontends }
    end
  end

  #find friends based on course matches
  def find_friends courses_array
    temp = Courses.parse_course_infos(courses_array, @user.univ_id)
    @user.update_course_list!(temp)
    redirect_to "http://apps.facebook.com/coursemateapp/"
  end

  #connect to the OCR app
  def upload_file
    img_url = params[:upload][:upload_file]
    url = URI.parse("http://courseservice.apphb.com/service1/#{img_url}")
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    courses_array = ActiveSupport::JSON.decode( res.body.gsub(/\<\S*\>/, '').gsub(/\<[\S\s]*\>/, ''))
    find_friends(courses_array)
  end

end
