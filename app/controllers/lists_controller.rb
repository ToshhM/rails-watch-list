class ListsController < ApplicationController
  def index #voir la list
    @lists = List.all
  end

  def show #detail
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new #nouvelle list
    @list = List.new
  end

  def create #create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end

  end
  private

  def list_params
    params.require(:list).permit(:name)
  end
end
