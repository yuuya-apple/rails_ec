class SessionController < ApplicationController
  def new
  end

  def create
    user=User.find_by(name:session_params[:name])
    if user&.authenticate(session_params[:password])
      session[:user_id]=user.id
      redirect_to(root_url,notice:"ログインしました")
    else
      flash.now[:alert]="ユーザー名またはパスワードが違います"
      render :new ,status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to(root_url,notice:"ログアウトしました")
  end


private
  def session_params
    params.require(:session).permit(:name,:password)
  end

end