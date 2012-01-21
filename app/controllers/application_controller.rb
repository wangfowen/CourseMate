class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user
	@oauth = Koala::Facebook::OAuth.new('http://apps.facebook.com/coursemateapp/')
	request = params[:signed_request]
	data = @oauth.parse_signed_request(request)
	access_token = data["oauth_token"]
	
	if data["user_id"]
		@user = Users.load_user(data)
		session[:id] = @user.fb_id
		session[:access_token] = access_token
	else
		return redirect_to @oauth.url_for_oauth_code(:permissions => "publish_stream,user_photos,friends_photos,user_education_history,read_friendlists")
	end
  end
end
