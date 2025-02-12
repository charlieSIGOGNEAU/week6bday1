class StaticPagesController < ApplicationController
  def team
  end

  def contact
  end


  
  def home
    @gossips = Gossip.all 
  end

  def welcome
    @first_name = params[:first_name]
  end

  def gossip
    @gossip = Gossip.find(params[:id])
    @title = @gossip.title
    @content = @gossip.content
    @author_first_name = @gossip.user.first_name
    @author_last_name = @gossip.user.last_name
    @user_id = @gossip.user.id
    @created =@gossip.created_at
  end
  def user
  @user = User.find(params[:id])
  @first_name = @user.first_name
  @last_name = @user.last_name
  @city = @user.city.name
  @age = @user.age
  end

end
