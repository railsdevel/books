class PagesController < ApplicationController

  def home
    
  end

  def browse
    @lists = List.limit(20)
    @books = Book.limit(20)
    @users = User.limit(20)
  end
  
end
