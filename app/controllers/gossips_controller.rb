class GossipsController < ApplicationController
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
    @user_id = @gossip.user.id
    @created =@gossip.created_at
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = User.find(1)  # Assigner l'utilisateur avec ID 1 au potin


    if @gossip.save
      redirect_to root_path, notice: 'Le potin a été créé avec succès !' #La clé ici est le notice, qui est une variable flash que tu peux utiliser pour afficher un message d'alerte de succès. Elle sera utilié dans la view
      puts "-" * 60
      puts notice
      puts "-" * 60
    else
      render :new, status: :unprocessable_entity #render :new permet de garder les donnée de @gossip et ses erreurs. apres dans la view @gossips.errors renvois les erreur en question, celle qui son codé dans le model pour la creation de gossip
      # status: :unprocessable_entity cést pour que le navigateur soi au courant que la requette est valide, amais a échoué. c'est une bonne pratique
    end

    def edit
      @gossip = Gossip.find(params[:id])
    end

    def update 
      @gossip = Gossip.find(params[:id])
      if @gossip.update(gossip_params)
        redirect_to @Gossip, notice: "Le potin a été mis à jour avec succès !"
      else
        render :edit
      end
    end

  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
