class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def edit
    # @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)


    if @user.save

      redirect_to action: 'index'
      flash[:success] = "¡Se agrego un empleado correctamente!"
    else
      redirect_back fallback_location: users_path
      flash[:error] = "¡upps algo salio mal!#{@user.errors.full_messages.to_sentence}"
    end

    # name: params[:user][:name], lastname: params[:user][:lastname], email: params[:user][:email], phone: params[:user][:phone]
    #render json: @article

  end



  def update
    # @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to action: 'index'
  end

  def destroy

    # @user = User.find(params[:id])
    @user.destroy
    redirect_to action: 'index'

  end

  def show
  end


  def find_user
    @user = User.find(params[:id])
  end



  private
  def user_params
    params.require(:user).permit(:name,:lastname,:email,:phone,:image)
  end


end
