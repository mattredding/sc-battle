class VoteController < ApplicationController
  def cast
    @soundcloud_track_id = Track.find(params[:track_id]).soundcloud_track_id
    @vote = Vote.new(
      :track_id => params[:track_id],
      :soundcloud_track_id => @soundcloud_track_id,
      :user_id => current_sc_user[:id],
      :battle_id => params[:battle_id]
    )
    if @vote.save
      redirect_to "/battle/show/#{params[:battle_id]}"
    else
      @vote = Vote.find(:first, :conditions => [
        "user_id = #{current_sc_user[:id]} AND battle_id = #{params[:battle_id]}"
      ])
      if(@vote.track_id != params[:track_id])
        @vote.track_id = params[:track_id]
        @vote.soundcloud_track_id = @soundcloud_track_id
        @vote.save
        redirect_to "/battle/show/#{params[:battle_id]}"
      else
        logger.debug "You already voted for this track."
      end
    end
  end
end