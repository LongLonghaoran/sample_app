class SessionsController < ApplicationController
  include ApplicationHelper
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      #使用flash才能确保登录成功后（先登录失败一次），错误提示消失，now表示flash值在
      # 当前这次请求中有效,因为这里登录错误之后是render重新渲染页面算不上新的请求
      # flash仍然会存留到下一次请求的页面中
      flash.now[:error] = "用户名或密码错误"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  def dingding_login
    code = params[:code]
    sign_user_by_dd(code)
  end
end
