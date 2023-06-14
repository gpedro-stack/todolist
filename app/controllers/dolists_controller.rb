  class DolistsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
  def index
    if user_signed_in?
      @lists = current_user.dolists.all

    end

  end

  def show

    @list = current_user.dolists.find(params[:id])

    if current_user != @list.user
      redirect_to root_path
    end


  end

  def new
    @list = current_user.dolists.build
  end

  def create
    @list = current_user.dolists.build(dolist_params)

    if @list.save
      redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit

    @list = current_user.dolists.find(params[:id])
    if current_user != @list.user
      redirect_to root_path
    end

  end

  def update

    @list = current_user.dolists.find(params[:id])

    if @list.update(dolist_params)
      redirect_to @list

    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy

    @list = Dolist.find(params[:id])
    @list.destroy
    redirect_to root_path, status: :see_other

  end



  private
  def dolist_params
    params.require(:dolist).permit(:day,:user_id)
  end
end
