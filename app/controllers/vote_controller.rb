class VoteController < ApplicationController
  def cast
    @vote = Vote.new(
      :soundcloud_track_id => params[:soundcloud_track_id],
      :user_id => current_sc_user[:id],
      :battle_id => params[:battle_id]
    )
    if @vote.save
      redirect_to "/battle/show/#{params[:battle_id]}"
    else
      # find vote with this user and battle id
      @vote = Vote.find(:first, :conditions => [
        "user_id = #{current_sc_user[:id]} AND battle_id = #{params[:battle_id]}"
      ])
      # logger.debug "@vote is #{@vote.inspect}"
      if(@vote.soundcloud_track_id != params[:soundcloud_track_id])
        @vote.soundcloud_track_id = params[:soundcloud_track_id]
        @vote.save
        redirect_to "/battle/show/#{params[:battle_id]}"
      end
    end
  end
end
