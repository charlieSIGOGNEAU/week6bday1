class UsersController < ApplicationController
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
end
