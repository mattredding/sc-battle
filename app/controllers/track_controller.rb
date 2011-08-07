class TrackController < ApplicationController
  def create
    @track = Track.new(
      :user_id => current_sc_user[:id],
      :soundcloud_track_id => params[:soundcloud_track_id],
      :title => params[:title]
    )
    @track.save
  end
  def show
    @tracks = @current_sc_user.tracks
    # @tracks = Track.all
  end
end
