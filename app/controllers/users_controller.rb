class UsersController < ApplicationController
  def index
    @users = User.all
    render 'index.html.erb'
  end

  def show
    @user = User.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    @user.save
    # render 'show.html.erb'
    redirect_to "/users/#{@user.id}"
  end

  def edit
    @user = User.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.password = params[:password]
    @user.email = params[:email]
    @user.password_confirmation = params[:password_confirmation]

    @user.save

    redirect_to "/users/#{@user.id}"
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to "/users"
  end
end