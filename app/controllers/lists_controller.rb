class ListsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]

  def index

  end

  def show

  end
  
  def authorize
    redirect_to '/auth/google/' unless signed_in?
  end
end
