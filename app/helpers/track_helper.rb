module TrackHelper
  def soundcloud_track(track_id)
    current_sc_user.soundcloud_client.get("/me/tracks/"+track_id.to_s)
  end
  def voted?(track_id)
    Track.find(track_id).votes.find(:first, :conditions => {:user_id => current_sc_user[:id]}) ? true : false
  end
end