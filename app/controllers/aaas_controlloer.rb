class LoginsController < ApplicationController
    
    def create
        @user = User.find_by(uname: params[:session][:uname])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_uname] = @user.uname
            flash[:info] = "logged in as #{@user.uname}"
            redirect_to root_path
        else
            flash[:danger] = 'invalid email/password combination'
            redirect_to root_path
        end
    end

end