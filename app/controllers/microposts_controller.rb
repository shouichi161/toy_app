class MicropostsController < ApplicationController
  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.user_id = current_user.id
    if @micropost.save
      redirect_to microposts_path
    else
      render:new
    end
  end

  def index
    @microposts = Micropost.all
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      redirect_to micropost_path(@micropost.id)
    else
      render:edit
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
