class SessionsController < ApplicationController
  def create
    auth = request.env['rack.auth']
    unless @auth = Authorization.find_from_hash(auth)
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    self.current_user = @auth.user

    redirect_to :root
  end

  def destroy
    @auth = nil
    self.current_user = nil
    redirect_to :root
  end
end
