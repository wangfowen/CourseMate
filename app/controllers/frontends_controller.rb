class FrontendsController < ApplicationController

  require 'json'
  require 'open-uri'

  before_filter :authenticate_user

  # GET /frontends
  # GET /frontends.json
  def index
    @graph = Koala::Facebook::API.new(session[:access_token])
    #if user's courses is null
      @body = 'upload'
      #@display = @graph.get_connections("me", "albums")
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

  def find_friends courses_array
    temp = Courses.parse_course_infos(courses_array)
    #@user.update_courses(temp)
    redirect_to "http://apps.facebook.com/coursemateapp/"
  end

  def upload_file
    url = CGI.escape(params[:upload][:upload_file])
    #courses_hash = JSON.parse(
    #  open("http://coursemateapp.appharbor.com/#{url}")
    #)['courses']
    courses_array = [
                     [{"CourseName" => "ECE250"},
                      {"CourseTime" => ["Monday 12:30-1:30", "Tuesday 12:30-1:30"]},
                      {"CourseLocation" => "RCH 103"}],
                     [{"CourseName" => "ECE222"},
                      {"CourseTime" => ["Wednesday 1:30-2:30", "Thursday 6:30-7:30"]},
                      {"CourseLocation" => "RCH 103"}]
                    ]
    find_friends(courses_array)
  end

end
