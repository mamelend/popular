class UsersController < ApplicationController
  def create
    user = User.find_by(facebook_id: params["facebook_id"])
    if !user
      user = User.new(facebook_id: params["facebook_id"], first_name: params["first_name"], last_name: params["last_name"], facebook_id:
      params["facebook_id"], profile_pic_url: params["profile_pic_url"])
      if user.save
        session[:user_id] = user.id
      end
    else
      session[:user_id] = user.id
    end
  end


  def logout
    session.clear
  end
end