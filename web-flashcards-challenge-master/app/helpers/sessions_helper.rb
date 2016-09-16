def current_user
	User.find_by(id:session[:user_id])
end

def logged_in?
	!!current_user
end

def require_user
	logged_in? == true
end