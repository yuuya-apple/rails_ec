class Admin::UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    @user.is_admin=true
    if @user.save
      redirect_to(items_url,notice:"ユーザー登録完了")
    else
      render :new,status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password,:password_confirmation)
  end
end
