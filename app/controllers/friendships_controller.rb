class FriendshipsController < ApplicationController
    def create
        if current_user
            p params 
            fship = current_user.friendships.new(:uname => params[:aaa][:uname])
            if fship.save
                flash[:info] = "friendships added"
                redirect_to root_path
            else
                flash[:info] = "追加できません。"
                redirect_to root_path
            end
        else
          flash[:info] = "please login"
          redirect_to root_path
        end
    end
end
