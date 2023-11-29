class SessionsController < ApplicationController
    before_action :set_user, :authorize_request,only: [:signout]
    def new 
        @user=User.new
    end

    def signout
        debugger
        # @user = User.find_by_email(login_params[:email])
        if @user.present? && !@user.token.nil?
            token = JsonWebToken.encode(user_id: @user.id) 
           @user.update(token:nil)
          render 'home', user: @user
        else
            render json: "Your session is expired"  
       end
    end  

    private 
    def set_user
        @user = User.find(params[:user_id])
    end
  
end
