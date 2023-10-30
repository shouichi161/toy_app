class MicropostsController < ApplicationController
  def new
    @micropost = Micropost.new
  end
  def create
    micropost = Micropost.new(micropost_params)
    micropost.user_id = current_user.id
    micropost.save
    redirect_to microposts_path
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def micropost_params
    params.require(:micropost).permit[:content]
  end
end
