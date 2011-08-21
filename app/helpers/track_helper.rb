module TrackHelper
  def voted?(track_id)
    if logged_in?
      Track.find(track_id).votes.find(:first, :conditions => {:user_id => current_sc_user[:id]}) ? true : false
    else
      false
    end
  end
end