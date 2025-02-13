class CommentsController < ApplicationController
  before_action :set_gossip
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @gossip.comments.new(comment_params)
    @comment.user = User.find(1) # L'utilisateur actuel, par exemple l'utilisateur avec ID 1

    if @comment.save
      redirect_to gossip_path(@gossip), notice: 'Commentaire ajouté avec succès.'
    else
      redirect_to gossip_path(@gossip), alert: 'Erreur lors de l\'ajout du commentaire.'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to gossip_path(@gossip), notice: 'Commentaire mis à jour.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to gossip_path(@gossip), notice: 'Commentaire supprimé.'
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end

  def set_comment
    @comment = @gossip.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
