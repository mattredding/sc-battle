class WelcomeController < ApplicationController
  def index
  end

  def show
    @tracks = current_sc_user.soundcloud_client.get("/me/tracks", :limit => 5)
    @me     = current_sc_user.soundcloud_client.get("/me")
  end

  def update
    res = current_sc_user.soundcloud_client.put("/me", :user => {:description => params[:description]})
    redirect_to :action => :show
  end
end
