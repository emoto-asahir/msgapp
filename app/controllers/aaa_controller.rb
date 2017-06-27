class AaaController < ApplicationController
    def create
        p params
        p "aaaaaaaaaaaaaaaaaaaa"
        p params[:aaa][:uname]
        @user = User.find_by(uname: params[:aaa][:uname])
        if @user && @user.authenticate(params[:aaa][:password])
            session[:user_uname] = @user.uname
            flash[:info] = "logged in as #{@user.uname}"
            redirect_to root_path
        else
            flash[:danger] = 'invalid email/password combination'
            redirect_to root_path
        end
    end
    
    def new

    end
    
    def test
        if current_user
            flash[:danger] = 'invalid email/password combination'
            redirect_to root_path
        else
            flash[:danger] = 'invalid email/d combination'
            redirect_to root_path
        end
    end
    
    def destroy
        session[:user_uname] = nil
        flash[:info] = "logged out"
        redirect_to root_path
    end
    
end
