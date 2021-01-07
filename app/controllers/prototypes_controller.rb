class PrototypesController < ApplicationController
  # ログイン認証
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @prototypes = Prototype.all
  end
  
  def new
    @prototype = Prototype.new
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def create
    @prototype = Prototype.new(prototypes_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
    @prototype =  Prototype.find(params[:id])
    if @prototype.user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @prototype =  Prototype.find(params[:id])
    if @prototype.user.id != current_user.id
      redirect_to root_path
    end
    if @prototype.update(prototypes_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def destroy
    @prototype =  Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private
  def prototypes_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
