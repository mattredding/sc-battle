class BattleController < ApplicationController
  def index
    @battles = Battle.all
  end

  def show
    @battle = Battle.find_by_id(params[:id])
    @battle_tracks = []
    @battle.tracks.each do |track|
      track_id = track.soundcloud_track_id
      @battle_tracks.push( current_sc_user.soundcloud_client.get("/me/tracks/"+track_id.to_s) )
    end

    if logged_in?
      @hide_join_button = !!@battle.tracks.find(:first, :conditions => [ "user_id = ?", @current_sc_user.id])
    else
      @hide_join_button = true
    end
  end

  def create
    @battle = Battle.new()
    @battle.save
  end

end
