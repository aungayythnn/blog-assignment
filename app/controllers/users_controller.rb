class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_later
      flash[:notice] = "User created successfully!"
      redirect_to users_list_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def list
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User updated successfully!"
      redirect_to users_list_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "User not found"
      redirect_to users_list_path
    end
end
