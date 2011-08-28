class VoteController < ApplicationController
  def cast
    # check if already voted on track in this battle
    @vote = Vote.find(:first, :conditions => [
      "user_id = #{current_sc_user[:id]} AND battle_id = #{params[:battle_id]}"
    ])
    @soundcloud_track_id = Track.find(params[:track_id]).soundcloud_track_id
    if @vote.nil?
      # create new vote
      @vote = Vote.new(
        :track_id => params[:track_id],
        :soundcloud_track_id => @soundcloud_track_id,
        :user_id => current_sc_user[:id],
        :battle_id => params[:battle_id]
      )
      if @vote.save
        redirect_to "/battle/show/#{params[:battle_id]}"
      end
    else
      # update exisitng vote?
      if(@vote.track_id != params[:track_id])
        @vote.track_id = params[:track_id]
        @vote.soundcloud_track_id = @soundcloud_track_id
        if @vote.save
          redirect_to "/battle/show/#{params[:battle_id]}"
        end
      else
        logger.debug "You already voted for this track."
      end
    end
  end
end