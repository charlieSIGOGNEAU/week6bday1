class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
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
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
