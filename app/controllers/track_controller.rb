class TrackController < ApplicationController
  def create
    @battle = Battle.find_by_id(params[:battle_id])
    @track = @battle.tracks.create(
      :user_id => current_sc_user[:id],
      :soundcloud_track_id => params[:soundcloud_track_id],
      :title => params[:title]
    )
    if @track.save
      redirect_to "/battle/show/#{params[:battle_id]}"
    else
      # could not submit track
    end
  end
  def show
    @tracks = @current_sc_user.tracks
    # @tracks = Track.all
  end
  def new
    @battle_id = params[:id] #battle track will be submitted to
    @tracks = current_sc_user.soundcloud_client.get("/me/tracks", :limit => 5)
  end
end
