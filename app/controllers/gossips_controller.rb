class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:edit, :update, :destroy]

  def new
    @gossip = Gossip.new
  end

  def index
    @gossips = Gossip.all 
  end

  def show
    @gossip = Gossip.find(params[:id])
    @title = @gossip.title
    @content = @gossip.content
    @city = @gossip.user.city.name
    @author_first_name = @gossip.user.first_name
    @author_last_name = @gossip.user.last_name
    @user = @gossip.user
    @user_id = @gossip.user.id
    @created =@gossip.created_at
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = User.find(session[:user_id])  # Assigner l'utilisateur avec ID 1 au potin


    if @gossip.save
      redirect_to gossips_path, notice: 'Le potin a été créé avec succès !' #La clé ici est le notice, qui est une variable flash que tu peux utiliser pour afficher un message d'alerte de succès. Elle sera utilié dans la view
      puts "-" * 60
      puts notice
      puts "-" * 60
    else
      render :new, status: :unprocessable_entity #render :new permet de garder les donnée de @gossip et ses erreurs. apres dans la view @gossips.errors renvois les erreur en question, celle qui son codé dans le model pour la creation de gossip
      # status: :unprocessable_entity cést pour que le navigateur soi au courant que la requette est valide, amais a échoué. c'est une bonne pratique
    end    
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update 
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to gossip_path, notice: "Le potin a été mis à jour avec succès !"
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy  # Suppression du potin
    redirect_to gossips_path, notice: "Le potin a été suprimé"
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def authenticate_user
    puts "#"*60
    puts 
    if current_user == nil
    redirect_to gossips_path, notice: "veillez vous conecter ou vous inscrir."
    end
    if current_user != Gossip.find(params[:id]).user
    redirect_to gossips_path, notice: "vous n'etes pas autorisé a faire cette requette."
    end

  end

end
