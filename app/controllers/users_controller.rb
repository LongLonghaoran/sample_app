class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      # 用户注册成功后（User对象/实例保存成功）会新建一个flash变量，在show视图模板中会用到，一旦刷新页面，则flash失效，提示信息也即消失
      flash[:success]="欢迎来到德莱联盟"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confimation)
  end
end
