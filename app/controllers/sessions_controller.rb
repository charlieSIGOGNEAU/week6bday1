class SessionsController < ApplicationController

  def new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])
  
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to gossips_path, notice: "Connexion réussie !" # redirige où tu veux, avec un flash ou pas
    else
      puts "#"*60
      flash[:alert] = "Email ou mot de passe invalide"
      puts flash[:alert]
      redirect_to new_session_path    
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to gossips_path, notice: "Déconnexion réussie !"
  end

end
