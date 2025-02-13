class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # Auto-login après inscription
      redirect_to gossips_path, notice: "Compte créé et connecté !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    puts "-" *60
    puts params
    @user = User.find(params[:id])
    
    @first_name = @user.first_name
    @last_name = @user.last_name
    @description = @user.description
    @email = @user.email
    @age = @user.age
    @city = @user.city.name
    @city_id = @user.city.id
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :password, :password_confirmation, :city_id)
  end
end

