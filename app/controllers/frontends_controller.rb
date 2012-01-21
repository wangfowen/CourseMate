class FrontendsController < ApplicationController

  require 'json'
  require 'open-uri'

  before_filter :authenticate_user

  # GET /frontends
  # GET /frontends.json
  def index
    @graph = Koala::Facebook::API.new(session[:access_token])
    #if user's courses is null
      @display = @graph.get_object("me")
      #@graph.getalbums
      #render partial for upload pic
    #else
      #do a join on your courses and your friends' courses
      #@variable = list of friends with same courses
      #render partial for show who's in your classes
    #end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frontends }
    end
  end

  def ocr_url url
    url = CGI.escape(url)
    courses_hash = JSON.parse(
      open("http://blahblah.com/#{url}")
    )['courses']
    find_friends(courses_hash)
  end

  def find_friends courses_hash
    #temp = Courses.parse_course_infos(courses_hash)
    #@user.update_courses(temp)
    #redirect to index
  end

end