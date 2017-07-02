class UsersController < ApplicationController
  before_action :signed_in_user,only:[:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]



  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User destroyed!"
    redirect_to users_url
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
    #在new.html.erb渲染模板的时候传递个字符串过去
    @title = 'sign_up'
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
    @title = 'update'
  end

  def update
    @title = 'update'
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
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

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confimation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
