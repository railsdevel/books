class ListsController < ApplicationController
  before_filter :ensure_login, :except => [:index, :show]
  before_filter :ensure_right_user, :only => [:edit, :update, :destroy]

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new

    3.times { @list.books.build }
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = current_user.lists.build(params[:list])

    if @list.save
      flash[:notice] = 'List created'
      redirect_to @list
    else
      @list.books.build if @list.books.length.zero?      
      render :action => 'new'
    end
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(params[:list])

    if @list.save
      flash[:notice] = 'List created'
      redirect_to @list
    else
      @list.books.build if @list.books.length.zero?
      render :action => 'new'
    end
  end

  def destroy

  end

  private
  def ensure_login
    redirect_to '/' unless signed_in?
  end

  def ensure_right_user
    redirect_to '/' unless List.find(params[:id]).user == current_user
  end
end
